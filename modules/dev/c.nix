{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    cmake
    # clang # Causes collision with gcc beacuse both install c++ bins (why?)
  ];
}
