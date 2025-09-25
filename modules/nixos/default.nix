{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./window-manager/hyprland
    ./networking
    ./boot
    ./hardware
    ./services
    ./system
    ./console.nix
    ./locale.nix
    ./fonts.nix
    ./nix.nix
  ];
}
