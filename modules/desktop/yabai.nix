{ pkgs, ... }:

{
  home.packages = [ pkgs.yabai pkgs.skhd ];

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
  };

  services.skhd = {
    enable = true;
    config = ''
      # open terminal
      cmd - return : /Users/kepler/.nix-profile/bin/kitty
      
    '';
  };
}
