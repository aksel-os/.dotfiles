{ config, pkgs, lib, ...}

{
  programs.zsh = {
    enable = true
    shellAliases = {
      javacc = "javac *.java";
      javacleaner = "rm *.class";
      IN1000 = "cd ~/UiO/Semester_1/IN1000/";
      IN1020 = "cd ~/UiO/Semester_1/IN1020/";
      IN1140 = "cd ~/UiO/Semester_1/IN1140/";
    };
  };

}
