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

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      mkHost = import ./lib { inherit inputs; };
      eachSystem = lib.genAttrs [ "x86_64-linux" ];
      treefmtEval = system: inputs.treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
        programs = {
          nixfmt.enable = true;
          gofmt.enable = true;
          rustfmt.enable = true;
          biome.enable = true;
          ruff-format.enable = true;
          clang-format.enable = true;
          shfmt.enable = true;
        };
      };
    in
    {
      formatter = eachSystem (system: (treefmtEval system).config.build.wrapper);
      checks = eachSystem (system: (treefmtEval system).config.build.check);

      nixosConfigurations.nixos = mkHost "nixos" "x86_64-linux";
    };
}
