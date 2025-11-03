{
  description = "Dio Kyrie's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, winapps, millennium, ... } @ inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in {
      packages.${system}.nixos = nixpkgs.lib.nixosSystem {
        inherit system; # Why was this needed?
        specialArgs = { inherit inputs unstable system; }; # Inherit system here for Winnapps.
        modules = [
          home-manager.nixosModules.home-manager
          ./configuration.nix
          # Winapps bellow
          (
            {
              pkgs,
              system ? pkgs.system,
              ...
            }:
            {
              environment.systemPackages = [
                winapps.packages."${system}".winapps
                winapps.packages."${system}".winapps-launcher # optional
              ];
            }
          )
          # Winapps above
        ];
      };
      
      # nix develop shells
      devShells.${system}.rust = import ./Shells/Rust/shell.nix { inherit pkgs; };
    };
}