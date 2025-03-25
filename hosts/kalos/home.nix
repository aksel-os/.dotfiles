{ inputs, config, pkgs, userSettings, ... }:

{  
  home = {
    username = userSettings.user;
    homeDirectory = "/Users/${userSettings.user}";
    
    stateVersion = "24.05";  # Please read the comment before changing.
  };

  imports = [
    # Terminal ++
    ../../modules/desktop/term/kitty.nix # My terminal config
    ../../modules/shell/zsh.nix # My zsh config
    ../../modules/shell/starship.nix # My omp config
    ../../modules/shell/direnv.nix
    ../../modules/shell/git.nix # My git config

    # Text editor
    ../../modules/editors/emacs.nix
    # ../../modules/editors/neovim.nix # Ptuey!
    ../../modules/latex/latex.nix

    # Programming languages
    # ../../modules/dev
    ../../modules/dev/hunspell.nix
    ../../modules/dev/python.nix
    ../../modules/dev/java.nix
    ../../modules/dev/c.nix

    # Applications
    # ../../modules/apps/
    # ../../modules/apps/zotero.nix
    ../../modules/apps/pandoc.nix
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
