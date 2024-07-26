{ pkgs, ... }:

{


# kernel  
#boot.kernelPackages = pkgs.linuxPackages_xanmod;
boot.kernelPatches = [ {
        name = "enable RT_FULL";
        patch = null;
        extraConfig = ''
            PREEMPT y
            PREEMPT_BUILD y
            PREEMPT_VOLUNTARY n
            PREEMPT_COUNT y
            PREEMPTION y
            '';
          } ];
boot.kernelModules = [ "kvm-amd" ];

nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; 

[

      # gui
      kitty
      kitty-themes
      blackbox-terminal
      youtube-music
      clapper
      obsidian
      protonvpn-gui
      figma-linux
      github-desktop
      vlc
      yad

      # tools
      sbctl
      clang-tools
      tgpt
      home-manager
      nh
      gh
      cryptsetup
      lvm2
      corectrl
      zfs
      zfstools
      gnome.gnome-keyring
      gnome.nautilus
      pkgs.home-manager
      fd
      ripgrep
      fzf
      socat
      jq
      gojq
      acpi
      ffmpeg
      libnotify
      killall
      zip
      unzip
      glib
      showmethekey
      vscode
      wget
      vim
      

      # langs
      nodejs
      gjs
      bun
      cargo
      go
      gcc
    ];
}


