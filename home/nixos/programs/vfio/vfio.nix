{ options, config, pkgs, ... }:

{

  systemd.services.libvirtd = {
    path = let
             env = pkgs.buildEnv {
               name = "qemu-hook-env";
               paths = with pkgs; [
                 bash
                 libvirt
                 kmod
                 systemd
                 ripgrep
                 sd
               ];
             };
           in
             [ env ];
           


    preStart =
    ''
      mkdir -p /persist/var/lib/libvirt/hooks


      mkdir -p /persist/var/lib/libvirt/hooks/qemu.d/endeavor/release/end
      mkdir -p /persist/var/lib/libvirt/hooks/qemu.d/endeavor/prepare/begin

     mkdir -p /persist/var/lib/libvirt/hooks/qemu.d/ubuntu/release/end
     mkdir -p /persist/var/lib/libvirt/hooks/qemu.d/ubuntu/prepare/begin

      
      ln -sf /persist/etc/nixos/xiNSpace/Navi/home/nixos/programs/vfio/symlinks/qemu /persist/var/lib/libvirt/hooks

      ln -sf /persist/etc/nixos/xiNSpace/Navi/home/nixos/programs/vfio/symlinks/start.sh /persist/var/lib/libvirt/hooks/qemu.d/endeavor/prepare/begin/start.sh
      ln -sf /persist/etc/nixos/xiNSpace/Navi/home/nixos/programs/vfio/symlinks/stop.sh /persist/var/lib/libvirt/hooks/qemu.d/endeavor/release/end/stop.sh

      ln -sf /persist/etc/nixos/xiNSpace/Navi/home/nixos/programs/vfio/symlinks/start.sh /persist/var/lib/libvirt/hooks/qemu.d/ubuntu/prepare/begin/start.sh
      ln -sf /persist/etc/nixos/xiNSpace/Navi/home/nixos/programs/vfio/symlinks/stop.sh /persist/var/lib/libvirt/hooks/qemu.d/ubuntu/release/end/stop.sh
        
    '';
  };  
  

}
