{
  description = "Muh Nix Flake";

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./modules/flake-parts];};

  inputs = {
    # Nix
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };

    # Darwin
    darwin = {
      type = "github";
      owner = "nix-darwin";
      repo = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew = {
      type = "github";
      owner = "zhaofengli";
      repo = "nix-homebrew";
    };

    # Secrets
    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/aksel-os/.secrets.git?shallow=1";
      flake = false;
    };

    # Emacs, my beloved
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
}
