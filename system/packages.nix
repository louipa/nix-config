{ pkgs, cursor, ... }:
{

  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.firefox = {
    enable = true;
    policies = {
      ImportEnterpriseRoots = true;
    };
  };

  programs.nix-ld.enable = true;

  services.udev.packages = with pkgs; [ platformio-core.udev ];

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # Apps
    obsidian
    libreoffice
    onlyoffice-desktopeditors
    unityhub
    orca-slicer

    # Communication
    discord
    whatsapp-for-linux
    element-desktop
    tailscale
    vesktop
    sidequest
    bruno

    # Developement Apps
    postman
    vscode
    zed-editor
    cursor.packages.x86_64-linux.cursor
    ghostty

    # Developement tools
    go
    python314
    nixfmt
    nixfmt-rfc-style
    starship
    bat
    lazygit
    zoxide

    # Multi media
    obs-studio
    blender
    vlc

    # Browser
    chromium

    # System
    util-linux
    htop
    lsof
    udev
    uv
    fprintd
    iio-sensor-proxy
    eza
    gnome-randr
    libinput
  ];
}
