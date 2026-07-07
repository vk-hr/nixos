{
  description = "NixOS + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      mkHost = import ./lib { inherit inputs; };
    in
    {
      formatter = lib.mapAttrs (system: pkgs: pkgs.nixfmt) nixpkgs.legacyPackages;

      nixosConfigurations.nixos = mkHost "nixos" "x86_64-linux";
    };
}
