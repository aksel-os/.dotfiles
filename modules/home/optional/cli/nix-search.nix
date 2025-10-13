{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "ns";

      runtimeInputs = [
        pkgs.fzf
        pkgs.nix-search-tv
      ];

      text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
    })
  ];
}
