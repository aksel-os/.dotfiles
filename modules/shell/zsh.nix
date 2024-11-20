{ config, pkgs, lib, userSettings, ...}:

let
  myAliases = {
    nix-fix = "/nix/nix-installer repair";
    home-rebuild = "home-manager switch --flake ~/.dotfiles/";

    cat = "bat --paging=never --style=plain";
    ls = "eza --icons -l -T -L=1";
    tree = "eza --tree --icons";
    htop = "btop";
    gitfetch = "onefetch"; 

    python-shell = "nix develop -f ~/.dotfiles/modules/dev/python/shell.nix";
    cc-shell = "nix develop -f ~/.dotfiles/modules/dev/cc/shell.nix";

    javacc = "javac *.java";
    javacleaner = "rm *.class";

    in1000 = "cd ~/uio/semester_1/in1000//";
    in1020 = "cd ~/uio/semester_1/in1020/";
    in1140 = "cd ~/uio/semester_1/in1140/";
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
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${zen-omp})"
    '';
  };

  home.packages = with pkgs; [
    fastfetch disfetch onefetch
    btop bat eza
  ];
}
