{ pkgs, lib, ... }:

{
  # Flatpak Support
  services.flatpak.enable = true;
  xdg.portal.enable = true;


  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub-beta";
    location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];

  services.flatpak.packages = [
    { appId = "com.brave.Browser"; origin = "flathub";  }
    "io.github.flattool.Warehouse"
    "app.devsuite.Ptyxis"
  ];


}
