{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    cmake
    libgccjit
    # clang # Causes collision with gcc beacuse both install c++ bins (why?)
  ];
}
