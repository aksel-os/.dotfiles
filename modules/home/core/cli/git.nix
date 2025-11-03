{ pkgs, ... }:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    # user = {
    #   name = "Aksel O. Steen";
    #   email = "aksel@akselos.no";
    # };

    userName = "Aksel O. Steen";
    userEmail = "aksel@akselos.no";

    ignores = [
      ".DS_Store"
      ".envrc"
      ".direnv"
    ];

    settings = {
      init.defaultBranch = "main";

      pull.rebase = true;
      rebase = {
        autoSquash = true;
        autoStash = true;
      };

      # Prune branches not on remote
      fetch.prune = true;

      branch = {
        sort = "committerdate";
      };

      url = {
        "git@github.com:".insteadOf = "gh:";
        "git@github.uio.no".insteadOf = "gho:";
      };
    };
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
    };
  };
}
