# Dio Kyrie's NixOS Flake
To use this flake:
1. Add command bellow to your `/etc/nixos/configuration.nix`
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
2. Run `nixos-rebuild` in terminal.
3. Download and extract this repository at any place you want.
4. Edit `yourpath/NixOSFlake/modules/packages.nix` and change `nh os switch "/run/media/apacerssd/5DFA-14F6/Obsidian/NixOSFlake"#nixos` to show correct path.
5. Run `nixos-rebuild` in terminal.
6. Run `nh os switch "yourpath/NixOSFlake"#nixos` in terminal.

#### Thats it
  Now you can rebuild your system at any time with `nixos-rebuild-flake`