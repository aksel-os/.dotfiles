{ lib, pkgs, inputs, userSettings, ...}:

{
  home = {
    username = userSettings.user;
    homeDirectory = "/home/${userSettings.user}";

    stateVersion = "24.05"; # Don't change
  };

  imports = [
    # Terminal ++
    ../../modules/shell/zsh.nix
    ../../modules/shell/starship.nix
    ../../modules/shell/direnv.nix

    # Editor
    ../../modules/editors/emacs.nix
    ../../modules/latex/latex.nix

    ../../modules/cmake/cmake.nix

    # Programming languages
    ../../modules/dev/python.nix

    # Misc.
    ../../modules/shell/git.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
