{ config, pkgs, ...}:

{
  python = with pkgs; [
    python312
    python312Packages.nltk
    python312Packages.numpy
    python312Packages.pip
    python312Packages.pyright
  ];
}
