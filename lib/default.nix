{ inputs, lib }:

let
  font = import ./font.nix;
  icons = import ./icons.nix { inherit lib; };
in
hostname: system:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs font icons;
  };
  modules = [
    ../hosts/${hostname}
    inputs.home-manager.nixosModules.home-manager
    inputs.agenix.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.niri-flake.nixosModules.niri
    {
      nixpkgs.overlays = [ inputs.helium.overlays.default ];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = {
        inherit inputs font icons;
      };
      home-manager.users.empty = import ../home;
    }
  ];
}
