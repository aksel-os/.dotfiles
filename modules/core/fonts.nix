{ lib, pkgs, ... }:

{
  fonts.packages = lib.attrValues {
    inherit (pkgs.nerd-fonts) jetbrains-mono;
  };
}
