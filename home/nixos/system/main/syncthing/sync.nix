{ config, lib, ... }:
{

services = {

    syncthing = {
        enable = true;
        user = "vi";
        dataDir = "/home/vi/Documents";    # Default folder for new synced folders
        configDir = "/home/vi/Documents/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};

}
