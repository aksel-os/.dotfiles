{ config, pkgs, lib, userSettings, ...}:

let
  myAliases = {
    em = "emacs -nw";    
    evim = "emacs -nw";
    
    nix-fix = "/nix/nix-installer repair";
    home-rebuilder = "home-manager switch --flake ~/.dotfiles/";
    darwin-rebuilder = "darwin-rebuild switch --flake ~/.dotfiles/";

    cat = "bat --paging=never --style=plain";
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

  # oh-my-posh profiles
  zen-omp = "https://raw.githubusercontent.com/dreamsofautonomy/zen-omp/main/zen.toml";
  atomic = "https://raw.githubusercontent.com/BirdeeHub/birdeeSystems/539ad08db103274d645f151c5f07e9df8c3efce4/common/term/shell/atomic-emodipt.omp.json";
  test = "https://github.com/charlesroper/oh-my-posh-themes/blob/main/pwsh.omp.json";

in {
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    initExtra = ''
      # eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${zen-omp})"      

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
    fastfetch disfetch onefetch
    btop bat eza
  ];
}
