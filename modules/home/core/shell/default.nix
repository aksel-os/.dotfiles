{
  imports = [
    ./zsh.nix # Unix shell of choice, also contains non-configured packages
    ./git.nix # Version controll
    ./direnv.nix # Environment variable manager
    ./bat.nix # A cat clone
    ./eza.nix # A modern alternative to ls
    ./starship.nix # Customizable shell prompt
    ./fastfetch.nix # System information
    ./btop.nix # Resource monitor
    ./dust.nix # Disk usage written in rust
    ./inetutils.nix # Common network programs
    ./yazi.nix # Terminal based file manager
  ];
}
