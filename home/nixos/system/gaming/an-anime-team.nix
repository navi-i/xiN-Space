{ config, pkgs, ... }:
let
  aagl-gtk-on-nix = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
in
{
  imports = [
    aagl-gtk-on-nix.module
    # aaglPkgs.module
  ];

  programs.anime-games-launcher.enable = true;
  programs.wavey-launcher.enable = true;
#  programs.anime-game-launcher.enable = true;
  aagl.enableNixpkgsReleaseBranchCheck = false;

}
