{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.kitty ];
  programs.kitty = {
    enable = true;
    themeFile = userSettings.theme;

    font = {      
      name = "JetBrainsMono Nerd Font Mono";
      size = 16;
    };

    settings = {
      cursor_blink_interval = 0;
      copy_on_select = "no";
      enable_audio_bell = "no";
      macos_option_as_alt = "right";
    };

    keybindings = {
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+7" = "goto_tab 7";
      "cmd+8" = "goto_tab 8";
      "cmd+9" = "goto_tab 9";
    };
  };
}
