{ pkgs, ... }:

{
  imports = [
    ./nix-search.nix
    ./pay-respects.nix # thefuck in Rust
    ./tealdeer.nix # tldr in Rust
  ];

  home.packages = with pkgs; [
    zellij # A modern terminal multiplexer
    # gitu # A magit like cli - moved to homebrew
    cbonsai
    pastel
    chafa # Terminal graphics
  ];
}
