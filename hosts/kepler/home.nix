{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.user;
  home.homeDirectory = "/Users/${userSettings.user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    # Terminal ++
    ../../packages/terminal/${userSettings.term}.nix # My kitty config
    ../../packages/shell/zsh.nix # My zsh config

    # Programming languages
    ../../packages/dev/python.nix

    # Misc
    ../../packages/git/git.nix # My git config
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
