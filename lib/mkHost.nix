{ inputs }:
{
  system,
  hostModule,
  homeModule,
  username,
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit inputs username;
  };
  modules = [
    hostModule
    inputs.home-manager.nixosModules.home-manager
    inputs.ragenix.nixosModules.default
    inputs.preservation.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
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

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit inputs username;
        };
        users.${username} = homeModule;
      };
    }
  ];
}
