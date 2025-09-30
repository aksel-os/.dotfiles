{
  home.shellAliases = {
    em = "emacs -nw";
    evim = "emacs -nw";

    nix-fix = "/nix/nix-installer repair";

    bat = "bat --paging=never --style=plain";
    cat = "bat";
    sl = "ls";
    ls = "eza --icons -l -T -L=1";
    tree = "eza --tree --icons";
    htop = "btop";
    gitfetch = "onefetch";

    javacc = "javac *.java";
    javacleaner = "rm *.class";

    hawk = "git";
  };
}
