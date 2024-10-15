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
  testPath = "https://raw.githubusercontent.com/dreamsofautonomy/zen-omp/main/zen.toml";

in {
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    initExtra = ''
      fastfetch
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${testPath})"
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}
