{ config, pkgs, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.user;
  home.homeDirectory = "/Users/${userSettings.user}";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [];
  home.file = {};
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  imports = [
    ../../lang/python/python.nix
    ../../shell/sh.nix
  ];

  # programs.zsh = {
  #   enable = true;
  #   shellAliases = {
  #     javacc = "javac *.java";
  #     javacleaner = "rm *.class";
  #     IN1000 = "cd ~/UiO/Semester_1/IN1000/";
  #     IN1020 = "cd ~/UiO/Semester_1/IN1020/";
  #     IN1140 = "cd ~/UiO/Semester_1/IN1140/";
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
