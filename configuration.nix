{ config, pkgs, ...}:
{
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
