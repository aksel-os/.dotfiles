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
  ];

  home.packages = with pkgs; [
    tinyscheme # Scheme LSP
    tinymist # Typst LSP
    lua-language-server
    vscode-langservers-extracted # HTML    
  ];
}
