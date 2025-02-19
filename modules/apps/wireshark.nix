{ config, pkgs, ... }:

{
  home.packages = [ pkgs.wireshark ];

  programs.wireshark = {
    enable = true;
  };
}
