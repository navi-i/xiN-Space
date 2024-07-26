{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ docker docker-compose ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;

};

virtualisation.docker.rootless = {
  enable = true;
  setSocketVariable = true;

};

}
