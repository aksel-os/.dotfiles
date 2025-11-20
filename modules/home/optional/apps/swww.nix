{ pkgs, ... }:

{
  home.packages = [ pkgs.swww ]; # awww

  services.swww.enable = true;
}
