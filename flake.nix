{

  description = "Hubble Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      # --- SYSTEM SETTINGS --- #
      systemSettings = {
        system = "aarch64-darwin";
        hostname = "Hubble";
      };

      # ---- USER SETTINGS ---- #
      userSettings = {
        user = "kepler";
        name = "Aksel Steen";
        email = "akselolav@gmail.com";
        dotfilesDir = "~/.dotfiles";
        locale = "en_US-UTF-8";
        theme = "catppuccin";
        term = "iTerm2";
      };

      # pkgs
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};
      
    in {
      darwinConfigurations = {
        ${systemSettings.hostname} = nix-darwin.lib.darwinSystem {
          system = systemSettings.system;
	        specialArgs = { inherit inputs; };
          modules = [
	          ./configuration.nix
	        ];
	      };
      };
      homeConfigurations = {
        ${userSettings.user} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
