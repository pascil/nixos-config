{
  networking.hostName = "Pascal-X240"; # Define your hostname.
  networking.useDHCP = false;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [22 80 443];
}
