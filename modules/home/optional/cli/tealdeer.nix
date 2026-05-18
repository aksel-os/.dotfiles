{ pkgs, ... }:

{
  home.packages = [ pkgs.tealdeer ];

  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
  };
}
