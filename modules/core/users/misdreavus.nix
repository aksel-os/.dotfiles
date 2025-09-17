{ pkgs, lib, ... }:

{
  users.users.misdreavus = lib.mkIf pkgs.stdenv.isLinux {
    home = "/home/misdreavus";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "nix"
      "sops-nix"
    ];

    hashedPassword = "$y$j9T$dPb2xAQb4YQyk2G5AQO6C0$NaInkWbv.zzHPXPO1Bn6QubKx82E8eQq38v7XSr0DI/";
  };

  programs.zsh.enable = true;
}
