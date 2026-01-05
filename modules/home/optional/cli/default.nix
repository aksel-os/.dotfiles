{ pkgs, ... }:

{
  imports = [
    ./nix-search.nix
    ./pay-respects.nix # thefuck in Rust
  ];

  home.packages = with pkgs; [
    cbonsai
    pastel
  ];
}
