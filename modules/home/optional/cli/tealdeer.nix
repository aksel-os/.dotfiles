{ pkgs, ... }:

{
  home.packages = [ pkgs.tealdeer ];

  programs.tealdeer = {
    enable = true;
    settings.updates = true;
  };
}
