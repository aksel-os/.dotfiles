{ inputs, ... }:

let
  inherit (inputs.self) lib;
  
  inherit (builtins) filter;
  inherit (lib.builder) mkHosts;

  hostPath = ../../hosts;
  
  kalos = import (hostPath + /kalos);
  sinnoh = import (hostPath + /sinnoh);
  johto = import (hostPath + /johto);
  systems = kalos.systems ++ sinnoh.systems ++ johto.systems;

in {
  flake = {
    darwinConfigurations = mkHosts (filter (x: x.os == "darwin") systems);
    nixosConfigurations = mkHosts (filter (x: x.os == "nixos" ||
                                                x.os == "linux") systems);
  };
}
