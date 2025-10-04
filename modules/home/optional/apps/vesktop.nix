{ pkgs, ... }:

{
  home.packages = [ pkgs.vesktop ];

  programs.vesktop = {
    enable = true;
  };
}
