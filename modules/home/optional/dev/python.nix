{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312
    pypy3
    pyright
    pylint
    python312Packages.autopep8
    python312Packages.numpy
    python312Packages.pip
  ];
}
