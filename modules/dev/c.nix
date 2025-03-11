{ pkgs, lib, ... }:

with pkgs;
{
  c = [
    gcc
    cmake
    clang
  ];
}
