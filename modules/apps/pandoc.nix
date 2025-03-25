{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.pandoc ];

  programs.pandoc = {
    enable = true;
  };
}
