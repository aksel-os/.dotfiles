{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    java
    jdt-language-server
  ];
}
