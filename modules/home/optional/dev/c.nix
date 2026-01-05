{ pkgs, lib, ... }:

{
  home.packages =
    with pkgs;
    [
      cmake
      # libgccjit
      # clang # Causes collision with gcc beacuse both install c++ bins (why?)
    ]
    ++ (lib.lists.optionals (pkgs.stdenv.isLinux) [ gcc ]);
}
