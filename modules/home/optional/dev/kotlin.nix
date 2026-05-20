{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kotlin
    gradle
    # kotlin-language-server # Deprecated in favor of Official LSP
    ktlint
  ];
}
