# shell.nix
{ pkgs ? import <nixpkgs> {} }:

let
  # The libraries for runtime environment
  libPathRust = with pkgs; lib.makeLibraryPath [
    # Graphics and windowing libraries
    libxkbcommon
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    wayland

    # X11 support (for fallback or if application uses X11)
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr

    gtk3
    rustlings
  ];
in

pkgs.mkShell {
  name = "rust";
  buildInputs = with pkgs; [
    rust-analyzer
    glib
    glibc
    rustup # With command "rustup default stable" will install cargo, clippy, rustc, rustfmt
    gcc
    musl
    wayland
    pkg-config
    gtk3
    rustlings
  ];

  shellHook = ''
    export RUST_BACKTRACE=1;
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${libPathRust}"
    export PKG_CONFIG_PATH="${pkgs.gtk3.dev}/lib/pkgconfig:${pkgs.glib.dev}/lib/pkgconfig:${pkgs.cairo.dev}/lib/pkgconfig:${pkgs.pango.dev}/lib/pkgconfig:${pkgs.harfbuzz.dev}/lib/pkgconfig:${pkgs.gdk-pixbuf.dev}/lib/pkgconfig:${pkgs.atk.dev}/lib/pkgconfig:${pkgs.rustlings}/lib/pkgconfig"
    export LD_LIBRARY_PATH="${pkgs.gtk3}/lib:${pkgs.glib}/lib:${pkgs.cairo}/lib:${pkgs.pango}/lib:${pkgs.harfbuzz}/lib:${pkgs.gdk-pixbuf}/lib:${pkgs.atk}/lib:$LD_LIBRARY_PATH"
  '';
}
