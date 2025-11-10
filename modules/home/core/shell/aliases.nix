{
  home.shellAliases = {
    em = "emacs -nw";
    evim = "emacs -nw";

    cd = "z";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "-" = "cd -";

    bat = "bat --paging=never --style=plain";
    cat = "bat";
    icat = "kitten icat"; # Show images in Kitty

    ls = "eza -lT --icons -L=1 --hyperlink";
    la = "ls -a";
    ll = "eza -lT --icons -L=1 --git-repos --git  --hyperlink";
    lla = "ll -a";
    tree = "eza --tree --icons";

    gitfetch = "onefetch";

    javacc = "javac *.java";
    javacleaner = "rm *.class";

    py = "python3";
  };
}
