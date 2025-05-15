{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager # enables nix-darwin management of home-manager
  ];
}
