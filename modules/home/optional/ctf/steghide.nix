{ pkgs, ... }:

{
  home.packages = [ pkgs.steghide pkgs.zsteg ];
}
