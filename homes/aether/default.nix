{ lib, ... }:

let
  optional = ../../modules/home/optional;

in
{
  imports = [
    (optional + /hyprland)
    (optional + /linux.nix)
    (optional + /apps/zen.nix)
    ../ssh.nix
    ../sops.nix
  ];

  config = {
    home = {
      username = lib.mkDefault "aether";
      homeDirectory = lib.mkDefault "/home/aether";
    };

    programs.home-manager.enable = true;
  };
}
