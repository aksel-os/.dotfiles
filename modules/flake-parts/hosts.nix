{ inputs, ... }:

let
  inherit (inputs.self) lib;
  
  inherit (builtins) filter;
  inherit (lib.builder) mkSystems;

  hostPath = ../../hosts;
  
  kalos = import hostPath + /kalos;
  sinnoh = import hostPath + /sinnnoh;
  johto = import hostPath + /johto;
  systems = kalos.systems // sinnoh.systems // johto.systems;
  
in { 
  flake = {
    darwinConfigurations = mkSystems (filter (x: x.system == "darwin") systems);
    nixosConfigurations = mkSystems (filter (x: x.system == "nixos" ||
                                                x.system == "linux") systems);
  };
}
