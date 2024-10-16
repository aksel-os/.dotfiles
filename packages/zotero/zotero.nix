{ config, lib, pkgs, ...}:

{
  home.packages = [ pkgs.zotero ];

  packages.zotero = {
    enable = true;
  };
}
