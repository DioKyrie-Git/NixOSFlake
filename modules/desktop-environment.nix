{ config, pkgs, ... }: {
  # Enable the X11/Wayland windowing system
  services.xserver.enable = true;

  # Enable the Desktop environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  # Enable Systray icons for Gnome and install dconf-editor
  environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator dconf-editor ];
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  
  # Exclude Gnome packages
  environment.gnome.excludePackages = (with pkgs; [
  gnome-contacts
  epiphany
  geary
  gedit
  gnome-text-editor
  gnome-tour
  gnome-font-viewer
  decibels
  yelp
  gnome-weather
  gnome-connections
  simple-scan
]);

  # Enable AMD Drivers
  # services.xserver.videoDrivers = [ "amdgpu" ]
}
