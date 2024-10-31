{ lib, config, pkgs, ... }:

{

  pkgs.mkShell {
    packages = [
      gcc
      cmake
    ];
  };

}
