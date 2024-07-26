{
  description = "Flake for configuration.nix";

inputs = { 
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  nix-gaming.url = "github:fufexan/nix-gaming";
  nix-flatpak.url = "github:gmodena/nix-flatpak";
  nixvim.url = "github:nix-community/nixvim";
  lanzaboote.url = "github:nix-community/lanzaboote/v0.4.1";
  plugin-onedark.url = "github:navarasu/onedark.nvim";
  plugin-onedark.flake = false;




  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
 };
};


outputs = { self, nixpkgs, nix-flatpak, lanzaboote, ... }@inputs:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
   inherit system;
   config = {
     allowUnfree = true;
  };
 };

in
  {

homeConfigurations."vi" =
inputs.home-manager.lib.homeManagerConfiguration {
inherit pkgs;
modules = [ ./nixos/system/home-manager/home.nix ];
extraSpecialArgs = { inherit inputs; };
};


nixosConfigurations = {
 navi = nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs system; };
  modules = [
    nix-flatpak.nixosModules.nix-flatpak
    ./nixos/system/main/configuration.nix
    lanzaboote.nixosModules.lanzaboote

   ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
            };
          })


     ];
  };
 };
};

}
