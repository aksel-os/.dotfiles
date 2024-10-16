{

  description = "Hubble Flake";

  inputs = {
    # Package library
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Manages macOS like nixOS
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Manages all host side applications
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Project/ Package manager for python
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
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
      darwinConfigurations = {
        ${systemSettings.hostname} = nix-darwin.lib.darwinSystem {
          system = systemSettings.system;
	        specialArgs = { inherit inputs;
                          inherit systemSettings;
                          inherit userSettings;
                        };
          modules = [
	          ./hosts/${userSettings.user}/configuration.nix
	        ];
	      };
      };
      homeConfigurations = {
        ${userSettings.user} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/${userSettings.user}/home.nix
          ];
          extraSpecialArgs = {
            inherit userSettings;
          };
        };
      };
    };
}
