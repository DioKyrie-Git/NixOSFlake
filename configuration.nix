{ config, pkgs, inputs, ... }: {
  # Import all .nix files with configurations
  imports =
    [
      ./hardware-configuration.nix
      ./home-manager.nix
      ./modules/boot.nix
      ./modules/networking.nix
      ./modules/locale.nix
      ./modules/libinput.nix
      ./modules/audio.nix
      ./modules/users.nix
      ./modules/automation.nix
      ./modules/desktop-environment.nix
      ./modules/packages.nix
    ];
  
  # Enables flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # NixOS Version at the moment when this configuration was created
  system.stateVersion = "25.05";

}
