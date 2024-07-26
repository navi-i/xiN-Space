{ config, pkgs,  inputs, ... }:
{

imports = [
   ./default.nix
   #inputs.nur.hmModules.nur
];

  home.username = "vi";
  home.homeDirectory = "/home/vi";
  home.stateVersion = "24.05"; # Please read the comment before changing.
#  home-manager.users.vi.home.services = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };



gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

     gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
  



