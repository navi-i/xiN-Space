{ config, pkgs, ... }:

{
    programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      equinusocio.vsc-material-theme-icons
      ms-vscode.cpptools-extension-pack
      chris-hayes.chatgpt-reborn
      piousdeer.adwaita-theme
      ms-vscode.cmake-tools
      mesonbuild.mesonbuild
      ms-python.python
      llvm-vs-code-extensions.vscode-clangd

    ];
  };


}
