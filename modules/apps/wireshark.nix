{ config, pkgs, ... }:

{
  home.packages = [ pkgs.wireshark ];
}
