{ inputs, withSystem, ... }:
let
  _lib = inputs.nixpkgs.lib;
  
  _customLib = _lib.makeExtensible (
    self:
    let
      lib = self;
    in
      {
        builder = import ./builder.nix { inherit lib inputs withSystem; };

        inherit (self.builder) mkSystems;
      }
  );

  trainerLib = _customLib.extend (_: _: _lib);
in
{
  flake.lib = trainerLib;
  perSystem._module.args.lib = trainerLib;
}
