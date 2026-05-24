{ pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    package = pkgs.qutebrowser;
    settings = {
      downloads.remove_finished = 1000;
      content = {
        javascript.enabled = false;
        cookies = {
          accept = "no-3rdparty";
          store = false;
        };
        headers = {
          accept_language = "en_US,en;q=0.5";
          do_not_track = null;
        };
      };
    };
  };
}
