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

  # oh-my-posh profiles
  zen-omp = "https://raw.githubusercontent.com/dreamsofautonomy/zen-omp/main/zen.toml";
  atomic = "https://raw.githubusercontent.com/BirdeeHub/birdeeSystems/539ad08db103274d645f151c5f07e9df8c3efce4/common/term/shell/atomic-emodipt.omp.json";

in {
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    initExtra = ''
      fastfetch
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${atomic})"
    '';
  };

  home.packages = with pkgs; [
    fastfetch
  ];
}
