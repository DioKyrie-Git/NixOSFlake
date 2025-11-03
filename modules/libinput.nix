{ config, pkgs, ... }: {
  # Touchpad support
  services.libinput.enable = true;
  services.libinput.touchpad = {
    tapping = true;
    scrollMethod = "twofinger";
    middleEmulation = true;
  };
}