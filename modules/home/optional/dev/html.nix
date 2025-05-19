{ pkgs, ... }:

{
  home.packages = [ pkgs.vscode-langservers-extracted ];
}
