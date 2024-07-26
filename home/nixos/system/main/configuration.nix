# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
    inputs.home-manager.nixosModules.home-manager
       ./syncthing/sync.nix
       ./hardware-configuration.nix
#       ./desktop-env/kde.nix
       ./desktop-env/gnome.nix
       ./users/users.nix
       ../base_pkgs/packages.nix
#       ../base_pkgs/nh.nix
       ../tools/gc.nix
       ../../programs/vfio/vfio.nix
#      ../base_pkgs/flatpak.nix
#      ../gaming/an-anime-team.nix
      ../gaming/steam.nix
      ../gaming/gamemode.nix
#      ../gaming/nix-gaming.nix
       ../virtualization/docker.nix
       ../virtualization/podman.nix
       ../virtualization/virt.nix

    ];

 nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };



#------------------------------------------------------------------
# User

mainUser.enable = true;
mainUser.userName = "vi";

#------------------------------------------------------------------
# Boot Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "zfs" "ext4" "btrfs" ]; 
  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.devNodes = "/dev/disk/by-partuuid";
  services.zfs.autoScrub.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.kernelParams = [
    "quiet"
    "splash"
    "amd_iommu=on"
    "iommu=pt"
    "amdgpu.ppfeaturemask=0xffffffff"
  ];
# boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/4c46cb89-9fc1-49e0-8283-d606e8a30c92";


# Needed for password to not get bombed on startup
fileSystems."/persist".neededForBoot = true;



#------------------------------------------------------------------
# Graphics

hardware = {
  graphics.enable = true;
 };



#------------------------------------------------------------------
# Environment Modules

  environment.etc = {


  "NetworkManager/system-connections".source = "/persist/etc/NetworkManager/system-connections";


};

environment.etc.crypttab.text = ''
    cryptstorage UUID=4c46cb89-9fc1-49e0-8283-d606e8a30c92 /persist/etc/crontab/mykeyfile.key
'';


#------------------------------------------------------------------

# Networking
  networking.hostName = "navi"; # Define your hostname.
  # Pick only one of the below networking options.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.hostId = "d13e0d41";
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

#------------------------------------------------------------------

  # Enable the X11 windowing system.
   services.xserver.enable = true;

#------------------------------------------------------------------

# Flakes

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

#------------------------------------------------------------------

# Home Manager

home-manager = {
     extraSpecialArgs = { inherit inputs; };
     users = {
        vi = import ../home-manager/home.nix;
      };
};

#------------------------------------------------------------------

# Apparmor

  security.apparmor = {
   enable = true;
};

#------------------------------------------------------------------

# Keyboard
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  i18n.inputMethod = {
   enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-anthy
      fcitx5-gtk
    ];
    ibus.engines = with pkgs.ibus-engines; [ anthy ];
  };
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

#------------------------------------------------------------------

 # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

#------------------------------------------------------------------

# Packages

fonts.packages = with pkgs; [
	nerdfonts
	noto-fonts
	noto-fonts-emoji
];

#------------------------------------------------------------------

# SSH

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

#------------------------------------------------------------------

# Auto Update

system.autoUpgrade = {
      enable = true;
};

#------------------------------------------------------------------

# Enables EYD

boot.initrd.postDeviceCommands = lib.mkAfter ''
  zfs rollback -r rpool/local/root@blank
'';



#------------------------------------------------------------------

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

