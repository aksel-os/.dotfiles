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

    MANPAGER = mkIf pkgs.stdenv.isLinux "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = mkIf pkgs.stdenv.isLinux "-c";
  };
}
