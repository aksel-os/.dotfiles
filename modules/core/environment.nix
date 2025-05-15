{ pkgs, config, ... }:

{
  environment.variables = {
    EDITOR = "emacs";
    VISUAL = "emacs";
    SUDO_EDITOR = "emacs";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  fonts.packages = {
    inherit (config.trainer.style.font) package;
  };
}
