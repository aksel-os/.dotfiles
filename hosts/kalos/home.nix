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
    ../../modules/shell

    # Text editor
    ../../modules/editors/emacs.nix
    ../../modules/editors/neovim.nix # Ptuey!
    ../../modules/latex/latex.nix

    # Programming languages
    # ../../modules/dev
    ../../modules/dev/hunspell.nix
    ../../modules/dev

    # Applications
    # ../../modules/apps/
    ../../modules/apps/zotero.nix
    ../../modules/apps/pandoc.nix
    ../../modules/apps/qbittorrent.nix

    # Security
    ../../modules/apps/wireshark.nix
    ../../modules/apps/sqlmap.nix
    ../../modules/apps/john.nix
    ../../modules/apps/steghide.nix

    # Virtualization
    ../../modules/apps/vm
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
