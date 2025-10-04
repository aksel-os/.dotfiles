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

    # hashedPasswordFile = secrets.passwords.aether.path;
    hashedPassword = "$y$j9T$dPb2xAQb4YQyk2G5AQO6C0$NaInkWbv.zzHPXPO1Bn6QubKx82E8eQq38v7XSr0DI/";
  };

  programs.zsh.enable = true;
}
