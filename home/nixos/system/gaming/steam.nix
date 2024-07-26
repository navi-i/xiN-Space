{ pkgs, ... }:

{
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; 
  dedicatedServer.openFirewall = true; 
  localNetworkGameTransfers.openFirewall = true; 
  gamescopeSession.enable = true;
};

  hardware.opengl.driSupport32Bit = true;
  environment.systemPackages = [ pkgs.steam ];
}
