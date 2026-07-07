{ ... }:

{
  imports = [
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./bash.nix
    ./locale.nix
    ./openssh.nix
    ./sudo.nix
    ./packages.nix
    ./fonts.nix
    ./nix-ld.nix
    ./gc.nix
    ./networking.nix
    ./audio.nix
    ./bluetooth.nix
    ./graphics/intel.nix
    ./power
    ./printing.nix
    ./greetd.nix
    ./niri.nix
    ./docker.nix
    ./libvirt.nix
    ./gaming.nix
    ./flatpak.nix
  ];
}
