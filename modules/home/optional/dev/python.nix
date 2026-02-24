{ pkgs, ... }:
let
  python = pkgs.python314.withPackages (
    ps: with ps; [
      autopep8
    ]
  );
in
{
  home.packages = with pkgs; [
    basedpyright
    ruff
    ty
    python
  ];
}
