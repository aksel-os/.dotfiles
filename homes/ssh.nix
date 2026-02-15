{
  config,
  lib,
  inputs,
  ...
}:
let
  inherit (config.sops) secrets;
  inherit (lib.attrsets) mapAttrs;
  inherit (inputs.secrets) uni;

  mkServers = server: {
    user = uni.user;
    hostname = server;
    proxyJump = "morgoth";
    identityFile = secrets."keys/ssh/uio".path;
  };

in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        # https://security.stackexchange.com/questions/110639/how-exploitable-is-the-recent-useroaming-ssh-vulnerability
        # useRoaming = false;
        # Explicit defaults
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = true;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "${config.home.homeDirectory}/.ssh/known_hosts";
        controlMaster = "auto";
        controlPath = "/tmp/%r@%h:%p";
        controlPersist = "no";
        forwardX11 = false;
      };

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
        user = uni.user;
        hostname = "login.uio.no";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "morgoth" = {
        user = uni.user;
        hostname = "morgoth.uio.no";
        identityFile = secrets."keys/ssh/uio".path;
      };

      "*.uio.no !login.uio.no" = {
        proxyJump = "${uni.user}@login.uio.no";
      };
    }
    // mapAttrs (name: mkServers) uni.servers;
  };
}
