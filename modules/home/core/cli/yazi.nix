{ pkgs, ... }:

{
  home.packages = [ pkgs.yazi ];

  catppuccin.yazi = {
    enable = true;
    flavor = "latte";
  };

  programs.yazi = {
    enable = true;
  };
}
