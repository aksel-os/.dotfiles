{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager # enables nix-darwin management of home-manager
    inputs.homebrew.darwinModules.nix-homebrew
  ];
}
