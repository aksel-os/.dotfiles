{ pkgs, ... }:

{
  home.packages = [
    pkgs.typescript
    pkgs.typescript-language-server
  ];
}
