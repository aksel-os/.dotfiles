{ config, pkgs, ...}:

{
  home.packages = [ pkgs.cmake ];
  
  programs.cmake = {
    enable = true;
  }  
}
