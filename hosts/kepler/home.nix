{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.user;
  home.homeDirectory = "/Users/${userSettings.user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ../../packages/dev/python.nix
    ../../packages/shell/sh.nix
    ../../packages/git/git.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
