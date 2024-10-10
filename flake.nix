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
      system = "aarch64-darwin";
      hostname = "Hubble";

      # ---- USER SETTINGS ---- #
      dotfilesDir = "~/.dotfiles";
      theme = "catppuccin";
      term = "iTerm2";

      # pkgs
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      
    in {
      darwinConfigurations = {
        Hubble = nix-darwin.lib.darwinSystem {
          inherit system;
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
