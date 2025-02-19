{ config, lib, pkgs, ... }:

{

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "ida-free"
    ];

}
