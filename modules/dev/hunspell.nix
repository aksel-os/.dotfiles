{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ hunspell ];
}
