{ inputs }:

{
  mkHost = import ./mkHost.nix { inherit inputs; };
  mkHome = import ./mkHome.nix { inherit inputs; };
}
