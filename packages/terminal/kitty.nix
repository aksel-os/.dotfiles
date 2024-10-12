{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.kitty ];
  programs.kitty = {
      enable = true;
      # font = userSettings.font;
      themeFile = userSettings.theme;
    };
}
