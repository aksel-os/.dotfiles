{ config, pkgs, ... }:

{
  # NB!!! the terminal command is "tshark" not "wireshark"
  home.packages = [ pkgs.wireshark ];
}
