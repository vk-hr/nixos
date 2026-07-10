{ inputs }:
{
  system,
  hostModule,
  homeModule,
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    hostModule
    inputs.home-manager.nixosModules.home-manager
    inputs.ragenix.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.niri.nixosModules.niri
    inputs.flatpak.nixosModules.nix-flatpak
    inputs.disko.nixosModules.default
    inputs.stylix.nixosModules.stylix
    {
      nixpkgs.overlays = [
        inputs.helium.overlays.default
        inputs.niri.overlays.niri
        inputs.fenix.overlays.default
      ];

      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.users.vkhr = homeModule;
    }
  ];
}
