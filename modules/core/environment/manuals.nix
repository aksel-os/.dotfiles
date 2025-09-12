{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  documentation = {
    enable = true;
    man.enable = true;
  };
}
