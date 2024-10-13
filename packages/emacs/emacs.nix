{ config, pkgs, ...}:

{

  home.packages = [ pkgs.emacs ];

  programs.emacs = {
    enable = true;
    
  };

}
