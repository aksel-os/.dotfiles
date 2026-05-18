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
  ];

  home.packages = with pkgs; [
    tinyscheme # Scheme LSP
    tinymist # Typst LSP
    marksman # Markdown LSP
    lua-language-server
    vscode-langservers-extracted # HTML    
  ];
}
