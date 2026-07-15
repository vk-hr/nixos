{ inputs }:
{
  system,
  homeModule,
  username,
}:
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.helium.overlays.default
      inputs.niri.overlays.niri
      inputs.fenix.overlays.default
    ];
  };
  extraSpecialArgs = {
    inherit inputs username;
  };
  modules = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    inputs.stylix.homeModules.default
    homeModule
  ];
}
