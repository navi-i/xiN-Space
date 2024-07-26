{ config, pkgs, ... }:


{
  imports = [../../programs/vfio/vfio.nix];

  environment.systemPackages = with pkgs; [ 
  virt-manager 
  distrobox 
  virt-viewer 
  spice
  spice-gtk
  spice-protocol
  win-virtio
  win-spice
]; 




systemd.tmpfiles.rules = [
    "L /var/lib/libvirt - - - - /persist/var/lib/libvirt"
  ];

system.activationScripts.libvirt-hooks.text =
  ''
      ln -Tfs /persist/var/lib/libvirt /var/lib/libvirt
  '';



virtualisation= {
  libvirtd = {
    enable = true;
    qemu = { 
      runAsRoot = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
   };
  };
spiceUSBRedirection.enable = true;
 };
services.spice-vdagentd.enable = true;
}

