
{ config, pkgs, ... }: {
  # default config file
  home.file.".config/default.txt".text = ''

  '';
}
