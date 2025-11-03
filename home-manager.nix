{ config, pkgs, ... }: {
  home-manager.users.apacerssd = {
    home.stateVersion = config.system.stateVersion;
    home.username = "apacerssd";
    home.homeDirectory = "/home/apacerssd";
    imports = [
      #./dotfiles/default.nix
    ];
  };
}
