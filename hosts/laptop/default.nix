{
  imports = [
    ./hardware-configuration.nix
    ./tweaks.nix
    ./power-usage.nix
    ../../configuration.nix
  ];

  networking.hostName = "laptop-loupa";

  virtualisation.libvirtd = {
    enable = true;
  };

  programs.virt-manager.enable = true;

  system.stateVersion = "24.11";
}
