# Shell for Python

let
  python = "python312";
  # Last updated: 2024-04-29. Check for new commits at https://status.nixos.org.
  pkgs = import <nixpkgs> {};

in pkgs.mkShell {
  packages = [
    (pkgs.${python}.withPackages (python-pkgs: with python-pkgs; [
      numpy
      nltk
    ]))
  ];
}
