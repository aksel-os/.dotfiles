{ pkgs, ... }:

{
  services.fail2ban = {
    enable = true;
    ignoreIP = [
      "127.0.0.0/8"
      "10.0.0.0/8"
      "192.168.0.0/16"
    ];
  };
}
