{ pkgs, ... }:

{
  imports = [
    ./nix-search.nix
  ];

  home.packages = with pkgs; [
    cbonsai
    pastel
  ];
}
