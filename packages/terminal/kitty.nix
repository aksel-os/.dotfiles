{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.kitty ];
  programs.kitty = {
    enable = true;
    themeFile = userSettings.theme;

    font = {
      package = pkgs.jetbrains-mono;
      name = "jetbrains-mono";
      size = 16;
    };

    settings = {
      cursor_blink_interval = 0;
      copy_on_select = "no";
      enable_audio_bell = "no";
    };

    keybindings = {
    };
  };
}
