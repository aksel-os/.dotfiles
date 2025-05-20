{ osConfig, ... }:

let
  inherit (osConfig.age) secrets;
in
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = secrets.keys-github.path;
      };

      "uio" = {
        user = "akselos";
        hostname = "login.uio.no";
        identityFile = secrets.uni-ssh.path;
      };

      "ifi" = {
        user = "akselos";
        hostname = "login.ifi.uio.no";
        proxyJump = "uio";
        identityFile = secrets.uni-ssh.path;
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
