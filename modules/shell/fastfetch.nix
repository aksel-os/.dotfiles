{ pkgs, ... }:

{
  home.packages = [ pkgs.fastfetch ];

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "/Users/kepler/.emacs.d/images/hatterene.png";
      };
    };
  };
}
