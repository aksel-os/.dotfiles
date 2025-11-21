{ lib, ... }:

let
  optional = ../../modules/home/optional;

in
{
  imports = [
    ../ssh.nix
    ../sops.nix
    (optional + /hyprland)
    (optional + /apps/zen.nix)
    # (optional + /linux.nix)
    optional
  ];

  config = {
    home = {
      username = lib.mkDefault "aether";
      homeDirectory = lib.mkDefault "/home/aether";
    };

    programs.home-manager.enable = true;
  };
}
