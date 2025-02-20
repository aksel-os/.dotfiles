{
  description = "Hubble Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    emacs-config = {
      url = "github:aksel-os/.emacs.d";
      flake = false;
    };
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, emacs-overlay, emacs-config, ... }@inputs:
    let
      #--=[ SYSTEM SETTINGS ]=--#
      systemSettings = {
        system = "aarch64-darwin";
        hostname = "Hubble";
        timezone = "Europe/Oslo";
        locale = "en_US.UTF-8";
      };

      # --=[ USER SETTINGS ]=-- #
      userSettings = {
        user = "kepler";
        name = "Aksel Steen";
        email = "akselolav@gmail.com";
        dotfilesDir = "~/.dotfiles";
        theme = "Catppuccin-Mocha";
        term = "kitty";
      };

      # pkgs
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      
    in {
      darwinConfigurations.${systemSettings.hostname} = nix-darwin.lib.darwinSystem {
        system = systemSettings.system;
          
        modules = [ ./hosts/${userSettings.user}/configuration.nix ];
          
	      specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };          
	    };    
      
      homeConfigurations = {
        ${userSettings.user} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
            
          modules = [ ./hosts/${userSettings.user}/home.nix ];

          extraSpecialArgs = {
            inherit userSettings;
            inherit inputs;            
          };            
        };
      };
    };
}
