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
        name = "kepler";
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
        Hubble = nix-darwin.lib.darwinSystem {
          inherit systemSettings.system;
	        specialArgs = { inherit inputs; };
          modules = [
	          ./configuration.nix
	        ];
	      };
      };
      homeConfigurations = {
        kepler = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
