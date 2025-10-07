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

      users.kepler = lib.mkIf pkgs.stdenv.isDarwin {
        imports = [ ./kepler ];
      };

      users.aether = lib.mkIf pkgs.stdenv.isLinux {
        imports = [
          ./aether
        ];
      };

      users.misdreavus = lib.mkIf pkgs.stdenv.isLinux {
        imports = [
          ./misdreavus
        ];
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
