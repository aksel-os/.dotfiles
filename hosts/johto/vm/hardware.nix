{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/202b7f6d-cbaa-441d-96e5-d02fea983f9d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BAB9-C25B";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/19a5e121-a2d1-4feb-a39d-0cf8cff1d093"; }
    ];
}
