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
    overlays = import ./overlays.nix { inherit inputs; };
  };
  extraSpecialArgs = {
    inherit inputs username;
  };
  modules = [
    inputs.self.homeModules.default
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
    inputs.stylix.homeModules.default
    homeModule
    (
      { pkgs, lib, ... }:
      {
        stylix.base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/black-metal-immortal.yaml";
      }
    )
  ];
}
