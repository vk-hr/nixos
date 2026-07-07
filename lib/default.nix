{ inputs }:

let
  font = import ./font.nix;
  colors = import ./colors.nix;
in
hostname: system:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs font colors;
  };
  modules = [
    ../hosts/${hostname}
    inputs.home-manager.nixosModules.home-manager
    inputs.ragenix.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.niri.nixosModules.niri
    inputs.flatpak.nixosModules.nix-flatpak
    {
      nixpkgs.overlays = [
        inputs.helium.overlays.default
        inputs.niri.overlays.niri
      ];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit inputs font colors;
      };
      home-manager.users.empty = import ../home;
    }
  ];
}
