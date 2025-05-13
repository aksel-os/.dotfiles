{ lib, inputs, withSystem, ... }:

let
  customLib = lib.fixedPoints.makeExtensible (
    self: {
      lib = self;
      builder = import ./builder.nix { inherit lib inputs withSystem; };

      inherit (self.builder) mkSystems;
    });

  trainerLib = customLib.extend (_: _: lib);
  
in
{
  flake.lib = trainerLib;
  perSystem._module.args.lib = trainerLib;
}
