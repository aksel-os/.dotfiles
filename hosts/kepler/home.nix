{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.user;
  home.homeDirectory = "/Users/${userSettings.user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ../../packages/shell/kitty.nix # My kitty config
    ../../packages/shell/sh.nix # My zsh config
    ../../packages/git/git.nix # My git config
    ../../packages/dev/python.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
