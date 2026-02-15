{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      cmake
    ]
    ++ (lib.lists.optionals (pkgs.stdenv.isLinux) [
      gcc
      gdb
      valgrind
    ]);
}
