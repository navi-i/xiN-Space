Personal NixOS configuration.

Contains :
- KDE / GNOME
- ZFS.
- ZFS Encryption.
- Erase your darlings.
- ZSH.
- Single GPU Passthrough using lbivirt/qemu.
- Secureboot using Lanzaboote (https://github.com/nix-community/lanzaboote)


Install guide for base NixOS ZFS setup is in this repository. I have not tested without ZFS, but if not using ZFS, simply remove all ZFS related lines in /system. 

This system is a personal workstation that can be used in many different ways. Having ZFS allows for nativeencryption. Erase your darlings keeps the system fresh and clean, as to not clog the machine. Automatic (sorta) GPU passthrough just incase another distro is needed. As well as secureboot to allow for dual booting Windows 11 easily. 



Still a work in progress. Changing as I go. 
