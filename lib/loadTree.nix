{ inputs }:

dir:

let
  haumea = inputs.haumea.lib;
  inherit (inputs.nixpkgs.lib) collect;
  inherit (builtins) isPath match;

  tree = haumea.load {
    src = dir;
    loader = [
      {
        matches = file: file != "default.nix" && match ".*\\.nix" file != null;
        loader = _: path: path;
      }
    ];
  };
in

# Flatten the nested attrset of paths into a list of paths
collect isPath tree
