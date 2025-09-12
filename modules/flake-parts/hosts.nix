{ inputs, ... }:
let
  inherit (inputs.self) lib;

  inherit (builtins) filter;
  inherit (lib.builder) mkSystems;

  hostPath = ../../hosts;

  kalos = import (hostPath + /kalos);
  sinnoh = import (hostPath + /sinnoh);
  johto = import (hostPath + /johto);
  systems = kalos.systems ++ sinnoh.systems ++ johto.systems;
in
{
  flake = {
    darwinConfigurations = mkSystems (filter (x: x.class == "darwin") systems);
    nixosConfigurations = mkSystems (filter (x: x.class == "nixos" || x.class == "linux") systems);
  };
}
