{ pkgs, ... }:

{

  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = "Aksel O. Steen";
    userEmail = "aksel@akselos.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
    
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
      save = "!git add -A && git commit -m 'SAVEPOINT'";
      wip = "commit -am 'WIP' --no-verify";
      undo = "reset HEAD~1 --mixed";
      wipe = "!git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard";
      po = "push origin";
      st = "status";
      unstage = "reset HEAD --";
      ponv = "po --no-verify";
      last = "log -1 HEAD";
      ll = "log --oneline";
      # ld  = "log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --date=short";
      la = "!git config -l | grep alias | cut -c 7-";
      tuah = "push";
    };
  };

}
