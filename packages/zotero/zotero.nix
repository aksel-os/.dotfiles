{ lib, ...}:

{
  home.packages = [ pkgs.zotero ];

  packages.zotero = {
    enable = true;
  };
}
