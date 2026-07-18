{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = false;
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
  };

  environment.systemPackages = [ pkgs.impala ];
}
