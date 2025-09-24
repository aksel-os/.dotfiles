{ pkgs, ... }:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = "Aksel O. Steen";
    userEmail = "aksel@akselos.no";

    ignores = [
      ".DS_Store"
      ".envrc"
      ".direnv"
    ];

    aliases = {
      co = "checkout";
      ec = "config --global -e";
      ppr = "pull --rebase --prune";
      cob = "checkout -b";
      rb = "branch -m";
      cm = "!git add -A && git commit -m";
      amend = "commit -a --amend";
      undo = "reset HEAD~1 --mixed";
      st = "status";
      last = "log -1 HEAD";
      ll = "log --oneline";
      graph = "log --all --decorate --graph --abbrev-commit --oneline";
      la = "!git config -l | grep alias | cut -c 7-";
      tuah = "push";
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;

      # Prune branches not on remote
      fetch.prune = true;

      branch = {
        sort = "committerdate";
      };

      url = {
        "git@github.com:".insteadOf = "gh:";
      };
    };
  };
}
