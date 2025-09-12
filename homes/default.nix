{
  lib,
  pkgs,
  self,
  self',
  inputs,
  inputs',
  config,
  ...
}:

let
  inherit (lib.modules) mkForce;

in
{
  config = {
    home-manager = {
      verbose = true;
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "bak";

      extraSpecialArgs = {
        inherit self self';
        inherit inputs inputs';
      };

      users.kepler = {
        imports = [ ./kepler ];
      };

      sharedModules = [
        {
          nix.package = mkForce config.nix.package;
          home.stateVersion = if pkgs.stdenv.isDarwin then "24.05" else config.system.stateVersion;
        }

        (self + /modules/home/core)
      ];
    };
  };
}
