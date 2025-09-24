{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager # enables nix-darwin management of home-manager

    ./system # Any nix-darwin system attrs
    ./security # security attrs
    ./services # service attrsn
    ./homebrew # nix-darwin can manage homebrew aswell
    ./nix.nix # some specific nix-darwin settings
    ./sops.nix
  ];
}
