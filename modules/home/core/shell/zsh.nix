{ pkgs, ...}:

let
  myAliases = {
    em = "emacs -nw";    
    evim = "emacs -nw";
    
    nix-fix = "/nix/nix-installer repair";
    home-rebuilder = "home-manager switch --flake ~/.dotfiles/";
    darwin-rebuilder = "darwin-rebuild switch --flake ~/.dotfiles/";

    cat = "bat --paging=never --style=plain";
    bat = "bat --paging=never --style=plain";
    ls = "eza --icons -l -T -L=1";
    tree = "eza --tree --icons";
    htop = "btop";
    gitfetch = "onefetch"; 

    python-shell = "nix develop -f ~/.dotfiles/modules/dev/python/shell.nix";
    cc-shell = "nix develop -f ~/.dotfiles/modules/dev/cc/shell.nix";
    java-shell = "nix develop -f ~/.dotfiles/modules/dev/java/shell.nix";

    javacc = "javac *.java";
    javacleaner = "rm *.class";
    
    hawk = "git";
  };

in {
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    initContent = ''
      eval "$(starship init zsh)"
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
    '';
  };
  
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  
  home.packages = with pkgs; [
    disfetch onefetch
    bat eza wget
  ];
}
