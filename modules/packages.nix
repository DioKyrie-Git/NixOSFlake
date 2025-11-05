{ config, pkgs, unstable, inputs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable USB support
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  
  # Install Steam
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  programs.steam = {
    enable = true;
    package = pkgs.steam-millennium;
  };
  
  # Enable Tor
  services.tor = {
    enable = true;
    enableGeoIP = false;
    client = {
      enable = true;
    };
    relay = {
      enable = false;
    };
  };

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable virtualisation
  virtualisation.libvirtd.enable = true;

  # GPU Specific settings
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-ocl
      intel-media-driver
      intel-gpu-tools
      vpl-gpu-rt
      intel-vaapi-driver
    ];
  };

  environment.systemPackages = with pkgs; [
  # To add pkgs from unstable version of NixOS use:
  # unstable.btop

  # GUI
  blender
  (bottles.override { removeWarningPopup = true; })
  brave
  discord
  gnome-boxes
  gnome-disk-utility
  kvmtool
  kdePackages.kdenlive
  motrix
  obs-studio
  obsidian
  onionshare-gui
  alpaca
  protonvpn-gui
  iaito
  inkscape
  scanmem
  nexusmods-app
  krita
  kiwix
  telegram-desktop
  teamspeak6-client
  tor-browser
  vscode-fhs
  openmw

  # CLI
  wget
  btop
  git
  nh
  clippy
  libretranslate
  
  # Support for Archive formats
  rar

  # These scripts bellow are added as terminal commands
    # Build flake from specified folder
    (writeShellScriptBin "nixos-rebuild-flake" ''
      nh os switch "/run/media/apacerssd/5DFA-14F6/Obsidian/NixOSFlake"#nixos
    '')
  ];

  # Remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}