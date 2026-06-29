{ ... }:

{
  imports = [
    ./boot.nix
    ./nix.nix
    ./users.nix
    ./locale.nix
    ./openssh.nix
    ./nix-ld.nix
    ./networking.nix
    ./audio.nix
    ./bluetooth.nix
    ./graphics/intel.nix
    ./power
    ./printing.nix
    ./greetd.nix
    ./niri.nix
  ];
}
