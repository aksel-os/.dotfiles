{ pkgs, ... }:

{
  services.qemuGuest.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = [ pkgs.virtiofsd ];

      ovmf = {
        enable = true;
      };
    };
  };
}
