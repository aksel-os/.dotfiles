{ pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
  };
}
