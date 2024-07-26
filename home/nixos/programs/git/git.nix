{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "navi-i";
    userEmail = "eeaai@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
  };
aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      ga = "git add";
    };
  };
}
