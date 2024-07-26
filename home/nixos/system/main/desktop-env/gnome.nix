{ pkgs, ... }:

{

     services.xserver.displayManager.gdm.enable = true;
     services.xserver.desktopManager.gnome.enable = true;


     environment.systemPackages = with pkgs;
     [
       gnomeExtensions.gsconnect
       pkgs.gnome3.gnome-tweaks
       gnomeExtensions.just-perfection
       gnomeExtensions.user-themes 
       gnomeExtensions.user-avatar-in-quick-settings 
       gnomeExtensions.proton-vpn-button 
       gnomeExtensions.pop-shell  
       gnomeExtensions.extension-list 
       gnomeExtensions.blur-my-shell
       gnome.gnome-terminal
       gnomeExtensions.dash-to-dock
     ];

      environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp # help viewer
      gnome-maps
      gnome-weather
      gnome-contacts
      simple-scan
]);
}
