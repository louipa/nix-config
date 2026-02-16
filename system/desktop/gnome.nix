{ pkgs, ... }:
{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "fr";
      xkb.variant = "azerty";
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.open-bar
    gnomeExtensions.dock-from-dash
    gnomeExtensions.bluetooth-battery-meter
    gnome-tweaks
    adwaita-icon-theme
    hicolor-icon-theme
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    simple-scan
    yelp
    geary
    seahorse
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-weather
  ];
}
