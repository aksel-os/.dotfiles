{ inputs, config, pkgs, userSettings, ... }:

{  
  home = {
    username = userSettings.user;
    homeDirectory = "/Users/${userSettings.user}";
    
    stateVersion = "24.05";  # Please read the comment before changing.
  };

  imports = [
    # Terminal ++
    ../../modules/desktop/term/${userSettings.term}.nix # My terminal config
    ../../modules/shell/zsh.nix # My zsh config
    ../../modules/shell/starship.nix # My omp config
    ../../modules/shell/direnv.nix

    # Text editor
    ../../modules/editors/emacs.nix
    ../../modules/latex/latex.nix
    
    ../../modules/cmake/cmake.nix

    # Programming languages
    ../../modules/dev
    
    ../../modules/shell/git.nix # My git config
    # ../../modules/apps/zotero.nix 
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
