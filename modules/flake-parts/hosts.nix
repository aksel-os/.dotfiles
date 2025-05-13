{ inputs, ... }:

let
  inherit (inputs.self) lib;
  
  inherit (builtins) filter;
  inherit (lib.builder) mkSystems;
  inherit (lib.lists) concatLists;

  hostPath = ../../hosts;
  
  kalos = import (hostPath + /kalos);
  sinnoh = import (hostPath + /sinnoh);
  johto = import (hostPath + /johto);
  systems = concatLists [kalos.systems  sinnoh.systems  johto.systems];

in {
  flake = {
    darwinConfigurations = mkSystems (filter (x: x.os == "darwin") systems);
    nixosConfigurations = mkSystems (filter (x: x.os == "nixos" ||
                                                x.os == "linux") systems);
  };
}
