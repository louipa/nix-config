{ config, ... }:
{
  networking.networkmanager.enable = true;

  networking.interfaces.wlp3s0.wakeOnLan = {
    enable = false;
  };

  # services.tailscale = {
  #   enable = true;
  #   authKeyFile = config.age.secrets.tailscale.path;
  # };
}
