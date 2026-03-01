{ pkgs, lib, ... }:
{
  # Stylix sets gtk theme to "adw-gtk3" by default, but we need "adw-gtk3-dark"
  # to fix unreadable black text on buttons in GTK dialogs (e.g. VS Code notifications)
  gtk = {
    enable = true;
    theme = {
      name = lib.mkForce "adw-gtk3-dark";
      package = lib.mkForce pkgs.adw-gtk3;
    };
  };
}
