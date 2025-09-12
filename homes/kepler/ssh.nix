{
  osConfig,
  lib,
  ...
}:
let
  inherit (osConfig.age) secrets;
  inherit (lib.lists) forEach;

  ifiServers = [
    "login" # login.ifi
    "adenin"
    "sytosin"
    "tymin"
    "guanin"
  ];

  uioServers = [
    "login"
    "morgoth"
    "gothmog"
    "soria"
    "moria"
  ];

  mkServers =
    {
      servers,
      user ? "akselos",
      hostname ? "uio.no",
      proxyJump ? null,
    }:
    {
      matchBlocks = forEach servers (server: {
        ${server} = {
          inherit user proxyJump;
          hostname = "${server}.${hostname}";
          identityFile = secrets.uni-ssh.path;
        };
      });
    };
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

      "github.uio.no" = {
        user = "git";
        identityFile = secrets.uni-github.path;
      };

      "uio" = {
        user = "akselos";
        hostname = "login.uio.no";
        identityFile = secrets.uni-ssh.path;
      };

      "morgoth" = {
        user = "akselos";
        hostname = "morgoth.uio.no";
        identityFile = secrets.uni-ssh.path;
      };

      "ifi" = {
        user = "akselos";
        hostname = "login.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets.uni-ssh.path;
      };

      # To be optimized

      "adenin" = {
        user = "akselos";
        hostname = "adenin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets.uni-ssh.path;
      };

      "tymin" = {
        user = "akselos";
        hostname = "tymin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets.uni-ssh.path;
      };

      "sytosin" = {
        user = "akselos";
        hostname = "sytosin.ifi.uio.no";
        proxyJump = "morgoth";
        identityFile = secrets.uni-ssh.path;
      };

      "guanin" = {
        user = "akselos";
        hostname = "guanin.ifi.uio.no";
        proxyJump = "morgoth";
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
