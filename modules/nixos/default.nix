{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./window-manager/hyprland
    ./networking
    ./boot
    ./hardware
    ./services
    ./misc.nix
    ./console.nix
    ./locale.nix
    ./fonts.nix
    ./nix.nix
  ];
}
