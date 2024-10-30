{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    python312
    python312Packages.nltk
    python312Packages.numpy
    python312Packages.pip
  ];
}
