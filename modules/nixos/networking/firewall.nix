{
  networking.firewall = {
    interfaces.wlan0 = {
      allowedTCPPorts = [ 57621 ];
      allowedUDPPorts = [ 5353 ];
    };
  };
}
