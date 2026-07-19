{ pkgs, ... }:

let
  niriSession = pkgs.runCommand "niri-session" { } ''
    mkdir -p $out/bin
    substitute ${pkgs.niri-unstable}/bin/niri-session $out/bin/niri-session \
      --replace-fail "systemctl --user import-environment" \
      "systemctl --user import-environment XDG_SESSION_TYPE"
    chmod +x $out/bin/niri-session
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${niriSession}/bin/niri-session";
        user = "greeter";
      };
    };
  };
}
