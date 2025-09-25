{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (config.sops) secrets;

in
{
  users.users.aether = lib.mkIf pkgs.stdenv.isLinux {
    home = "/home/aether";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "nix"
      "sops-nix"
    ];

    hashedPasswordFile = secrets.passwords.aether.path;
  };

  programs.zsh.enable = true;
}
