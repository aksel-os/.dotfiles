{ config, pkgs, lib, userSettings, systemSettings, ...}:
{

  imports = [

  ];

  services.nix-daemon.enable = true;

  # Flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.${userSettings.user} = {
    # isNormalUser = true;
    description = userSettings.user;
    shell = pkgs.zsh;
  };

  # I use zsh
  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;


  system.stateVersion = 5;
  
}
