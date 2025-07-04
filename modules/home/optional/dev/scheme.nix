{pkgs, ...}: {
  home.packages = [
    pkgs.tinyscheme
    # pkgs.racket # Allows platforms.unix, but not platforms.darwin ???
  ];
}
