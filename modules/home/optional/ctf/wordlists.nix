{ pkgs, ... }:

let
  wordlists = pkgs.wordlists.override {
    lists = with pkgs; [
      rockyou
    ];
  };

in
{
  home.packages = [ wordlists ];
}
