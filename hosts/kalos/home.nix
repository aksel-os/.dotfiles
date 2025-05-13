{ lib, pkgs, config, self, self', inputs, inputs', ... }:

{
  home-manager = {
    verbose = true;
    backupFileExtension = "bak";
    
    extraSpecialArgs = {
      inherit self self';
      inherit inputs inputs';
    };
  
    home.stateVersion = "24.05";  # Please read the comment before changing.
  
    # Let Home Manager install and manage itself.
  
    imports = [
      inputs.home-manager.darwinModules.home-manager
      
    # Terminal ++
    ../../modules/desktop/term/kitty.nix # My terminal config
    ../../modules/shell

    # Text editor
    ../../modules/editors

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
  };
  
  programs.home-manager.enable = true;
}
