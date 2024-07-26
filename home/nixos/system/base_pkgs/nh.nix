{ config, pkgs, ... }:

{
 programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/persist/etc/nixos/xiNSpace/Navi/home";
  };
}
