{ config, pkgs, inputs,... }:

{
  imports = [
#    ../nixvim/flake.nix
    ../../programs/git/git.nix
    ../../programs/codium/code.nix
    ../../programs/kitty/kitty.nix
    ../../programs/neovim/nvim.nix
    ../../programs/zsh/zsh.nix
#    ../../programs/vfio/Vfio.nix
    ../../programs/firefox/firefox.nix
    ../../programs/vim/vim.nix
  #   ./programs/vfio/vfio.nix
  ];
}
