{ pkgs, ... }:

{
  home.packages = [ pkgs.pay-respects ];

  programs.pay-respects = {
    enable = true;

    enableZshIntegration = true;

    options = [
      "--alias"
      "f"
    ];
  };
}
