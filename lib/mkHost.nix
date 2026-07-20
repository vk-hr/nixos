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
    inputs.self.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.ragenix.nixosModules.default
    inputs.preservation.nixosModules.default
    inputs.niri.nixosModules.niri
    inputs.flatpak.nixosModules.nix-flatpak
    inputs.disko.nixosModules.default
    inputs.stylix.nixosModules.stylix
    {
      nixpkgs.overlays = import ./overlays.nix { inherit inputs; };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit inputs username;
        };
        users.${username} = {
          imports = [
            homeModule
            inputs.self.homeModules.default
          ];
        };
      };
    }
  ];
}
