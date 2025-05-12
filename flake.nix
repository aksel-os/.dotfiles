{
  description = "Muh Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
    };

    emacs-overlay = {
      type = "github";
      owner = "nix-community";
      repo = "emacs-overlay";
    };

    emacs-config = {
      type = "github";
      owner = "aksel-os";
      repo = ".emacs.d";
      flake = false;
    };

    emacs-plus = {
      type = "github";
      owner = "d12frosted";
      repo = "homebrew-emacs-plus";
      flake = false;
    };
  };

  outputs = { self,
              darwin,
              nixpkgs,
              home-manager,
              emacs-overlay,
              emacs-config,
              emacs-plus,
              ... }@inputs:
    let
      #--=[ SYSTEM SETTINGS ]=--#
      systemSettings = {
        system = "aarch64-darwin";
        hostname = "kalos";
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
      # pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      lib = nixpkgs.lib;
      system = systemSettings.system;
      pkgs = import nixpkgs { inherit system; };
      
    in {
      nixosConfigurations = {
        ${systemSettings.hostname} = lib.nixosSystem {
          system = systemSettings.system;

          modules = [ ./hosts/${systemSettings.hostname}/configuration.nix ];

          specialArgs = {
            inherit inputs;
            inherit userSettings;
            inherit systemSettings;
          };
        };
      };
      
      darwinConfigurations = {
        ${systemSettings.hostname} = darwin.lib.darwinSystem {
          system = systemSettings.system;
          
          modules = [ ./hosts/${systemSettings.hostname}/configuration.nix ];

          specialArgs = {
            inherit inputs;
            inherit userSettings;
            inherit systemSettings;
          };
        };
      };    
      
      homeConfigurations = {
        ${userSettings.user} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
            
          modules = [ ./hosts/${systemSettings.hostname}/home.nix ];

          extraSpecialArgs = {
            inherit inputs;            
            inherit userSettings;
            inherit systemSettings;
          };            
        };
      };
    };
}
