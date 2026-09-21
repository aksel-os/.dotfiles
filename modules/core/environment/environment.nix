{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.modules) mkIf;

in
{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";

    MANSECT = "2:3:1:8:5:4:7:6:9:3P";
    MANPAGER = mkIf pkgs.stdenv.isLinux "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = mkIf pkgs.stdenv.isLinux "-c";
  };
}
