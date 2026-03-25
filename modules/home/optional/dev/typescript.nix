{ pkgs, ... }:

{
  home.packages = [
    pkgs.typescript
    pkgs.typescript-language-server
    pkgs.nodejs_22
  ];
}
