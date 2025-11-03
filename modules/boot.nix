{ config, pkgs, ... }: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Add Swap file
  swapDevices = [{
    device = "/swapfile";
    size = 16 * 1024; # 16GB
  }];

  # Add compression to Swap
  zramSwap.enable = true;
}
