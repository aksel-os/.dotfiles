{ pkgs, ... }:

{
  imports = [
    ./just.nix
    ./nix.nix
    ./python.nix
    ./java.nix
    ./c.nix
    ./sql.nix
    ./kotlin.nix
    ./typescript.nix
    ./go.nix
    ./markdown.nix
    ./typst.nix
  ];

  home.packages = with pkgs; [
    tree-sitter
    tinyscheme # Scheme LSP
    lua-language-server
    stylua # Lua Tooling
    vscode-langservers-extracted # HTML
  ];
}
