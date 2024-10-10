{

  description = "Hubble Flake";

  inputs = {
    nixpkgs.url = "github:nixpkgs/unstable";
    
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... } {
    let
      # --- SYSTEM SETTINGS --- #
      systemSettings = {
        system = "aarch64-darwin"
        hostname = "Hubble"
        timezone = ""
        locale = ""
      };

      # ---- USER SETTINGS ---- #
      userSettings = {
        dotfilesDir = "~/.dotfiles"
        theme = "catppuccin"
        term = "iTerm2"
        font = ""
      };

      # --- ---#
      lib = nixpkgs.lib;
      
    in
    darwinConfigurations = let
      inherit (inputs.nix-darwin.lib) darwinSystem
      in {
        Hubble = darwinSystem {
          system = system;
	  specialArgs = { inherit inputs; };
          modules = [
	    ./configuration.nix
	    
	  ];
	};
      };
    };
    darwinPackages = self.darwinConfigurations."Hubble".pkgs;
  };
}