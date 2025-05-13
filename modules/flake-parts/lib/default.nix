{ inputs, withSystem, ... }:
let
  customLib = inputs.nixpkgs.lib.makeExtensible (
    self:
    let
      lib = self;
    in
      {
        builders = import ./builders.nix { inherit lib inputs withSystem; };

        inherit (self.builders) mkSystems;
      }
  );

  lib = customLib.extend (_: _: inputs.nixpkgs.lib);
in
{
  flake.lib = lib;
  perSystem._module.args.lib = lib;
}
