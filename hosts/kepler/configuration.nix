{ config, pkgs, ...}:
{
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
