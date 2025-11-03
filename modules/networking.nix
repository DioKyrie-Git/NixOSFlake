{ config, pkgs, ... }: {
  networking.networkmanager.enable = true; # Enable networking
  networking.hostName = "apacerssd"; # Define your hostname
  # networking.wireless.enable = true;  # Enable networking via wpa_supplicant
}