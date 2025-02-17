{ config, pkgs, ... }:

{
  home.package = [ pkgs.libtool ];
}
