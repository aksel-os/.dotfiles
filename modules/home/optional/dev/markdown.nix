{ pkgs, ... }:

{
  home.packages = with pkgs; [
    marksman # LSP
    rumdl # Linter
    marp-cli
    # slidev
  ];
}
