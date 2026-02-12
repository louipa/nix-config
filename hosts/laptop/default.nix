{
  imports = [
    ./hardware-configuration.nix
    ./tweaks.nix
    ./power-usage.nix
    ../../configuration.nix
  ];

  networking.hostName = "laptop-loupa";

  system.stateVersion = "24.11";

  swapDevices = [
    {
      device = "/swapfile";
      size = 26 * 1024; # 26GB
    }
  ];
}
