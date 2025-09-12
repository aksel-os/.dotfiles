{ pkgs, ... }:

{
  home.packages = with pkgs; [ pkgs.qemu ];
}

# Creating an image:
#   qemu-img create -f qcow2 disk.img
