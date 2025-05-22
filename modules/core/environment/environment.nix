{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.modules) mkIf;
  
in {
  environment.variables = {
    EDITOR = "emacs";
    VISUAL = "emacs";
    SUDO_EDITOR = "emacs";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = mkIf pkgs.stdenv.isLinux "-c";
  };
}
