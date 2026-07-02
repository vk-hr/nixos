{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    liveRestore = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ ];
    };
  };

  environment.systemPackages = [ pkgs.docker-compose ];
}
