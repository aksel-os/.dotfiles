{ config, pkgs, ... }:

{
  home.packages = [ pkgs.texlive.combined.scheme-medium ];
  
  programs.texlive = {
    enable = true;    
  };
}
