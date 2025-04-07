{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    python312
    pyright
    python312Packages.autopep8
    python312Packages.nltk
    python312Packages.numpy
    python312Packages.pip
  ];
}
