{ pkgs, ... }:

{
  home.packages = [
    (pkgs.fenix.stable.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    pkgs.rust-analyzer
    pkgs.sccache
    pkgs.cargo-edit
    pkgs.cargo-watch
    pkgs.cargo-nextest
    pkgs.cargo-binstall
  ];

  home.sessionVariables.RUSTC_WRAPPER = "sccache";
}
