{ pkgs, ... }:

{
  home.packages = with pkgs; [ man-pages
                               linux-manual
                               man-pages-posix
                             ];

  documentation = {
    enable = true;
    dev.enable = true;
    man.enable = true;
  };
}
