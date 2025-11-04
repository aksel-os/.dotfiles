{ pkgs, lib, ... }:

let
  inherit (lib.modules) mkBefore mkAfter mkMerge;
in
{
  home.packages = [ pkgs.blesh ];

  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = mkMerge [
      (mkBefore ''
        [[ $- == *i* ]] && source "$(blesh-share)"/ble.sh --noattach
      '')

      (mkAfter ''
        [[ ! ''\${BLE_VERSION-} ]] || ble-attach
      '')
    ];
  };
}
