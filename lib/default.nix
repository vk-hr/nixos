{ inputs, lib }:

hostname: system:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
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
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.users.empty = import ../home;
    }
  ];
}
