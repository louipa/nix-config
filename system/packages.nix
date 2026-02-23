{
  pkgs,
  cursor,
  affinity-nix,
  ...
}:
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
    affinity-nix.packages.x86_64-linux.v3
    xournalpp
    aseprite
    krita

    # Communication
    discord
    wasistlos
    element-desktop
    tailscale
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
    nodejs_24
    pnpm
    nixfmt
    starship
    bat
    lazygit
    zoxide
    bun
    hyfetch

    # Multi media
    obs-studio
    blender
    vlc
    ollama

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
    btop
    net-tools
    amdgpu_top
    input-remapper
    powerstat
    powertop
    xclip
    winboat
    lon
    sbctl
  ];
}
