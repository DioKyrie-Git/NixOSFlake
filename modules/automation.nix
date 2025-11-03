{ config, pkgs, ... }: {
  # Enable Auto Optimization of nix store size
  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

  # Enable Auto Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
  systemd.timers."nix-gc.timer".timerConfig = {
    OnCalendar = "daily";
    Persistent = true;
  };

  # Enable Auto Upgrade
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
}
