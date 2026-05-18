{ pkgs, ... }:

{
  home.packages = with pkgs; [
    marksman
    marp-cli
    # slidev
  ];
}
