{ pkgs, ... }:

{
  home.packages = [
    pkgs.qemu
    pkgs.qemu_full
  ];
}

# Creating an image:
#   qemu-img create -f qcow2 disk.img
