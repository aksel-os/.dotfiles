{ config, pkgs, ... }:

{
  home.packages = [ pkgs.texliveFull ];
}
