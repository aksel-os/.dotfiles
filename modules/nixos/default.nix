{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko

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
