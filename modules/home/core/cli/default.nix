{ pkgs, ... }:

{
  imports = [
    ./git.nix # Version controll
    ./direnv.nix # Environment variable manager
    ./eza.nix # A modern alternative to ls
    ./starship.nix # Customizable shell prompt
    ./fastfetch.nix # System information
    ./btop.nix # Resource monitor
    ./yazi.nix # Terminal based file manager
    ./zoxide.nix # A smarter cd command
  ];

  # Packages without configuration
  home.packages = with pkgs; [
    dust # Disk usage util written in rust
    disfetch # Minimal fastfetch
    onefetch # Fastfetch but for git
    bat # A cat clone
    inetutils # Common networking programs
    wget

    # Nix rebuild
    nvd
    dix
    nix-output-monitor
  ];
}
