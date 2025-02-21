{ lib, pkgs, inputs, userSettings, systemSettings, ...}:

{
  home = {
    username = "empoleon";
    homeDirectory = "/home/empoleon";

    stateVersion = "24.05";
  };

  imports = [
    # Terminal ++
    ../../modules/shell/zsh.nix
    ../../modules/shell/oh-my-posh.nix

    # Editor
    ../../modules/editors/emacs.nix
    ../../modules/cmake/cmake.nix

    # Programming languages
    ../../modules/dev/python.nix

    # Misc.
    ../../modules/shell/git.nix
  ];

  programs.home-manager.enable = true;
}
