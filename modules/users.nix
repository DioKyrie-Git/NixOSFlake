{ config, pkgs, ... }: {
  users.users = {
    # Add new users here
    apacerssd /*User name. This will be your login*/ = {
      isNormalUser = true; # Autoconfigures many user ssettings
      description = "Apacer SSD"; # A short description of the user account, typically the user's full name
      extraGroups = [ "networkmanager" "audio" "wheel" "docker" "podman" ]; # What user should have control of
      initialPassword = "apacerssd"; # Initial user password which you NEED to change with terminal command "passwd"
    };
  };
}