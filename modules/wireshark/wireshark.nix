{ config, lib, pkgs, ... }:

{
  home.packages = [pkgs.wireshark];

  packages.wireshark = {
    enable = true;
  };
}
