{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.profiles.gaming.enable {
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      gamescope
      vulkan-tools
      mesa-demos
    ];

    networking.firewall = {
      allowedTCPPorts = [
        27036
        27037
      ];
      allowedUDPPorts = [
        27031
        27032
        27033
        27034
        27035
        27036
      ];
    };
  };
}
