{ config, pkgs, lib, ... }:


{

  home.packages = with pkgs; [
    eza
    starship
    bat
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    initExtra = ''
    ${pkgs.hyfetch}/bin/hyfetch
  '';

oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "frisk";
};
shellAliases = {
      ns = "nix-search";
      nswitch = "nh os switch /persist/etc/nixos/xiNSpace/Navi/home";
      cat = "bat";
      nr = "sudo nixos-rebuild switch --flake /persist/etc/nixos/xiNSpace/home/#navi";
      nclean = "sudo nix-collect-garbage -d";
      base = "cd /persist/etc/nixos/xiNSpace/Navi/home";
      nmain = "cd /persist/etc/nixos/xiNSpace/Navi/home/nixos/system/main";
      nixconf = "sudo vim /persist/etc/nixos/xiNSpace/home/nixos/system/main/configuration.nix";
      e = "eza -lha";
      eg = "eza -lha | grep";
      ga = "git add";
      gpom = "git push -u origin main";
      gpull = "git pull --rebase origin main";
      gdots = "git remote add origin https://github.com/navi-i/xiN-Space";
      # gmain = "sudo git branch -m master main";
      gmain = "git branch -M main";
     
       };

     };

programs.starship = {
  enable = true;
  # settings = pkgs.lib.importTOML ./starship.toml;
};

}
