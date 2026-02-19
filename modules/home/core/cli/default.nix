{ pkgs, ... }:

{
  imports = [
    ./git.nix # Version controll
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
    inetutils # Common networking programs
    wget

    # Nix rebuild
    nvd
    dix
    nix-output-monitor
  ];
}
