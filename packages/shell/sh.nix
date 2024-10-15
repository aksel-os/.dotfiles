{ config, pkgs, lib, ...}:

let
  myAliases = {
    python-shell = "nix develop -f ~/.dotfiles/packages/dev/python/shell.nix";
    javacc = "javac *.java";
    javacleaner = "rm *.class";
    IN1000 = "cd ~/UiO/Semester_1/IN1000/";
    IN1020 = "cd ~/UiO/Semester_1/IN1020/";
    IN1140 = "cd ~/UiO/Semester_1/IN1140/";
  };

in {
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}
