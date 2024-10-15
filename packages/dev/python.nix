{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    python312
    python312Packages.nltk
    python312Packages.numpy
  ];
}
