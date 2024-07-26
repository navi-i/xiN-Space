{ lib, config, pkgs, ... }:
{
  options = {
    mainUser.enable = lib.mkEnableOption "enable user";
    mainUser.userName = lib.mkOption {
#      default = "user";
      description =
         ''
        main user
        '';
    };
  };

# Users
config = lib.mkIf config.mainUser.enable {
  users.users.${config.mainUser.userName} = {
       home = "/home/${config.mainUser.userName}";
       hashedPasswordFile = "/persist/etc/passwd";
       description = "user";
       isNormalUser = true;
       extraGroups = [ "wheel" "libvirtd" "networkmanager" "docker" "qemu-libvirtd" ];
       shell = pkgs.zsh;
    };
 
 users.mutableUsers = false;
 programs.zsh.enable = true;


    };
}
