{ config, pkgs, lib, userSettings, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    useTheme = "catppuccin-mocha"; 
  };
}
