{
  pkgs,
  lib,
  config,
  ...
}:

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

    hashedPasswordFile = config.sops.secrets.passwords.aether.path;
  };

  programs.zsh.enable = true;
}
