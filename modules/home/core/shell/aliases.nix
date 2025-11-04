{
  home.shellAliases = {
    em = "emacs -nw";
    evim = "emacs -nw";

    cd = "z";
    bat = "bat --paging=never --style=plain";
    cat = "bat";
    ls = "eza -lT --icons -L=1 --hyperlink";
    la = "ls -a";
    ll = "eza -lT --icons -L=1 --git-repos --git  --hyperlink";
    lla = "ll -a";
    tree = "eza --tree --icons";
    htop = "btop";
    gitfetch = "onefetch";

    javacc = "javac *.java";
    javacleaner = "rm *.class";

    hawk = "git";
  };
}
