{ config, pkgs, ... }:


{
   services.displayManager.sddm.enable = true;
   services.desktopManager.plasma6.enable = true;
   services.xserver.displayManager.sddm.wayland.enable = true;

}
