{
  imports = [
    ./hardware-configuration.nix
    ./tweaks.nix
    ./power-usage.nix
    ../../system/common
    ../../system/desktop
  ];

  networking.hostName = "yoga";

  virtualisation.libvirtd = {
    enable = true;
  };

  programs.virt-manager.enable = true;

  system.stateVersion = "24.11";
}
