{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kotlin
    gradle
    kotlin-language-server
  ];
}
