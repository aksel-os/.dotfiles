{ inputs, ... }:

let
  inherit (inputs.self) lib;

  inherit (builtins) filter;
  inherit (lib.builder) mkSystems;
  
  kalos = import ./kalos;
  sinnoh = import ./sinnnoh;
  johto = import ./johto;
  systems = kalos.systems // sinnoh.systems // johto.systems;
  
in { 
  flake = {
    darwinConfigurations = mkSystems (filter (x: x.system == "darwin") systems);
    nixosConfigurations = mkSystems (filter (x: x.system == "nixos" ||
                                                x.system == "linux") systems);
  };
}
