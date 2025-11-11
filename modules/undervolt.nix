{ config, pkgs, ... }: {
  # Undervolt Intel CPU & GPU
  services.undervolt = {
    enable = true;
    uncoreOffset = -50;
  };
}