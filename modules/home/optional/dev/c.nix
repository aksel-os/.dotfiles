{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      cmake
      astyle
    ]
    ++ (lib.lists.optionals (pkgs.stdenv.isLinux) [
      gcc
      gdb
      valgrind
    ]);
}
