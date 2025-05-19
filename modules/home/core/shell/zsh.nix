{ pkgs, ...}:

let
  myAliases = {
    em = "emacs -nw";    
    evim = "emacs -nw";
    
    nix-fix = "/nix/nix-installer repair";

    cat = "bat --paging=never --style=plain";
    bat = "bat --paging=never --style=plain";
    ls = "eza --icons -l -T -L=1";
    tree = "eza --tree --icons";
    htop = "btop";
    gitfetch = "onefetch"; 

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
      ## Nix
      #if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      #. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      #fi
      ## End Nix
    '';
  };
  
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  
  home.packages = with pkgs; [
    disfetch onefetch wget
    nvd nix-output-monitor
  ];
}
