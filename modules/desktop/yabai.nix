{ ... }:

{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";

      # Padding
      top_padding = "10";
      bottom_padding = "10";
      left_padding = "10";
      right_padding = "10";
      window_gap = "10";
    };

    extraConfig = ''
      yabai -m rule --add app="^System Preferences$" manage=off
    '';
  };
}
