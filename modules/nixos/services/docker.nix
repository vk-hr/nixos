{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    liveRestore = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ ];
    };
  };

  environment.systemPackages = [ pkgs.docker-compose ];
}
