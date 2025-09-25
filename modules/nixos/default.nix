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
    ./nix.nix
    ./sops.nix
  ];
}
