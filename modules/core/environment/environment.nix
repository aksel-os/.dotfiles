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
    EDITOR = "hx";
    VISUAL = "hx";
    SUDO_EDITOR = "hx";

    MANPAGER = mkIf pkgs.stdenv.isLinux "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = mkIf pkgs.stdenv.isLinux "-c";
  };
}
