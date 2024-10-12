{ config, pkgs, lib, userSettings, systemSettings, ...}:
{

  imports = [

  ];

  services.nix-daemon.enable = true;

  # Flakes
  nix.extraOptions = ""
    experimental-features = nix-command flakes
  "";

  system.stateVersion = 5;
  
}
