{ lib, ... }:

{
  console = {
    keyMap = lib.mkForce "no";
  };
}
