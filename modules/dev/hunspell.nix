{ pkgs, ... }:

{
  home.packages = with pkgs; [ hunspell ];
}
