{ pkgs, ... }:
{
  programs.niri.enable = true;

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "azerty";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  services.upower.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Keyring for apps that need secret storage (e.g. VSCode, SSH keys)
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
}
