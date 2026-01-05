{ pkgs, ... }:

{
  imports = [
    ./nix-search.nix
  ];

  home.packages = with pkgs; [
    cbonsai
    pastel
    pay-respects # thefuck in Rust
  ];
}
