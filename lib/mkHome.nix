{ inputs }:
{
  system,
  homeModule,
  username,
}:
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit inputs username;
  };
  modules = [ homeModule ];
}
