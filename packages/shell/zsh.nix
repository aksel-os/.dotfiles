{ config, pkgs, lib, userSettings, ...}:

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
    initExtra = ''
    eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${./oh-my-posh/zen-omp.toml}"
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}
