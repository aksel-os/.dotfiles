{
  config,
  ...
}:
let
  inherit (config.sops) secrets;

in
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = secrets."keys/ssh/github".path;
      };

      "github.uio.no" = {
        user = "git";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "uio" = {
        user = "akselos";
        hostname = "login.uio.no";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "morgoth" = {
        user = "akselos";
        hostname = "morgoth.uio.no";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "ifi" = {
        user = "akselos";
        hostname = "login.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets."keys/ssh/uio".path;
      };

      # To be optimized

      "adenin" = {
        user = "akselos";
        hostname = "adenin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "tymin" = {
        user = "akselos";
        hostname = "tymin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "sytosin" = {
        user = "akselos";
        hostname = "sytosin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "guanin" = {
        user = "akselos";
        hostname = "guanin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "*.uio.no !login.uio.no" = {
        proxyJump = "akselos@login.uio.no";
      };
    };

    # https://security.stackexchange.com/questions/110639/how-exploitable-is-the-recent-useroaming-ssh-vulnerability
    extraConfig = ''
      Host *
        UseRoaming no
    '';
  };
}
