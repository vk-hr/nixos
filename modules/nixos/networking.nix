{
  networking = {
    networkmanager.enable = true;

    firewall.allowedTCPPorts = [ 57621 ];
    firewall.allowedUDPPorts = [ 5353 ];
  };
}
