{pkgs, inputs, ...}:

{

  environment.systemPackages = 
  [
  inputs.nix-gaming.packages.${pkgs.system}.osu-stable 
  ];

}
