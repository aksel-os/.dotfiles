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
    ../../modules/shell/oh-my-posh.nix # My omp config

    # Text editor
    ../../modules/editors/emacs.nix
    # ../../modules/latex/latex.nix
    
    ../../modules/cmake/cmake.nix

    # Programming languages
    ../../modules/dev/python.nix

    # Misc
    ../../modules/shell/git.nix # My git config
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
