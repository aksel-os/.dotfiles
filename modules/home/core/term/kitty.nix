{
  pkgs,
  config,
  ...
}:

{
  home.packages = [ pkgs.kitty ];
  
  programs.kitty = {
    enable = true;
    themeFile = "catppuccin-mocha";

    font = {      
      name = "JetBrainsMono Nerd Font Mono";
      size = 16;
    };

    settings = {
      cursor_shape = "block";
      cursor_blink_interval = 0;
      copy_on_select = "no";
      enable_audio_bell = "no";
      macos_option_as_alt = "left";
      remember_window_size = "no";
      initial_window_width = "95c";
      initial_window_height = "25c";
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

  # Take from: https://gist.github.com/eg-ayoub/0066d7bbc4456ef5d06b8277437dc0dd
  home.file = {
      "${config.xdg.configHome}/kitty/dark-theme.auto.conf" = {
        text = ''
          include ${pkgs.kitty-themes}/share/kitty-themes/themes/catppuccin-mocha.conf
          '';
        # not necessary.
        onChange = ''
          ${pkgs.procps}/bin/pkill -USR1 -u $USER kitty || true
          '';
      };

      "${config.xdg.configHome}/kitty/light-theme.auto.conf" = {
        text = ''
          include ${pkgs.kitty-themes}/share/kitty-themes/themes/catppuccin-latte.conf
          '';
        onChange = ''
          ${pkgs.procps}/bin/pkill -USR1 -u $USER kitty || true
          '';
      };

      "${config.xdg.configHome}/kitty/no-preference-theme.auto.conf" = {
        text = ''
          include ${pkgs.kitty-themes}/share/kitty-themes/themes/catppuccin-mocha.conf
          '';
        onChange = ''
          ${pkgs.procps}/bin/pkill -USR1 -u $USER kitty || true
          '';
      };

    };
}
