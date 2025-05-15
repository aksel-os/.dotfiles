{ lib, pkgs, ... }:

let
  inherit (lib.options) mkOption mkPackageOption;
  inherit (lib.types) str int;

in {
  options.trainer.style.font = {
    name = mkOption {
      type = str;
      description = "Font name";
      default = "JetBrains Mono";
    };

    package = mkPackageOption pkgs "nerd-fonts.jetbrains-mono" { };

    size = mkOption {
      type = int;
      description = "Font size";
      default = 16;
    };
  };
}
