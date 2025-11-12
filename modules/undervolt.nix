{ config, pkgs, ... }: {
  # Undervolt Intel CPU & GPU
  services.undervolt = {
    enable = true;
    turbo = 1;
    coreOffset = -50;
    gpuOffset = -50;
    uncoreOffset = -50;
    analogioOffset = -50;
    tempAc = 70;
    tempBat = 50;
    p1 = {
      limit = 12;
      window = 28;
    };
    p2 = {
      limit = 35;
      window = 0.00244;
    };
  };
}