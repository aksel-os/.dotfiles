{ pkgs, ... }:

{
  home.packages = [ pkgs.mpv ];

  programs.mpv = {
    enable = true;
  };
}
