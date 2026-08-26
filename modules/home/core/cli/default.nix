{ pkgs, ... }:

{
  imports = [
    ./git.nix # Version control
    ./direnv.nix # Environment variable manager
    ./eza.nix # A modern alternative to ls
    ./starship.nix # Customizable shell prompt
    ./fastfetch.nix # System information
    ./btop.nix # Resource monitor
    ./bat.nix # A cat clone
    ./yazi.nix # Terminal based file manager
    ./zoxide.nix # A smarter cd command
    ./atuin.nix # Shell history
    ./carapace.nix # Completion library
  ];

  # Packages without configuration
  home.packages = with pkgs; [
    dust # Disk usage util written in rust
    disfetch # Minimal fastfetch
    onefetch # Fastfetch but for git
    fzf # A command-line fuzzy finder
    ripgrep # A modern grep
    fd # A fast alternative to find

    inetutils # Common networking programs

    wget
    tmux

    # Nix rebuild
    nvd
    dix
    nix-output-monitor
  ];
}
