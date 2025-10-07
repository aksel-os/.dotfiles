{ pkgs, ... }:

{
  home.packages = [ pkgs.dunst ];

  services.dunst = {
    enable = true;
  };
}
