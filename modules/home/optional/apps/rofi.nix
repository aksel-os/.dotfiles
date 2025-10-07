{ pkgs, ... }:

{
  home.packages = [ pkgs.rofi ];

  programs.rofi = {
    enable = true;
    modes = [ "drun" ];
  };
}
