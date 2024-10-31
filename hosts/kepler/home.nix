{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.user;
  home.homeDirectory = "/Users/${userSettings.user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    # Terminal ++
    ../../modules/terminal/${userSettings.term}.nix # My terminal config
    ../../modules/shell/zsh.nix # My zsh config
    ../../modules/shell/oh-my-posh/oh-my-posh.nix # My omp config

    # Text editor
    ../../modules/emacs/emacs.nix

    # Programming languages
    ../../modules/dev/python.nix

    # Misc
    ../../modules/git/git.nix # My git config

    # Linux exclusive :(
    # ../../modules/ida-free/ida-free.nix # Reverse engineering ++, only on linux...
    # ../../modules/zotero/zotero.nix # Refrences
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
