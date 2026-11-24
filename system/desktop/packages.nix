{
  pkgs,
  cursor,
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

  programs.nix-ld.libraries = with pkgs; [
    openxr-loader
    vulkan-loader
    libGL
    stdenv.cc.cc.lib
  ];

  services.udev.packages = with pkgs; [ platformio-core.udev ];

  services.usbmuxd.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    # Apps
    obsidian
    libreoffice
    onlyoffice-desktopeditors
    unityhub
    orca-slicer
    affinity-v3
    xournalpp
    aseprite
    krita
    nautilus
    moonlight-qt

    # Communication
    discord
    element-desktop
    sidequest

    # Developement Apps
    postman
    vscode
    zed-editor
    cursor.packages.x86_64-linux.cursor
    ghostty
    jetbrains.rider
    jetbrains.webstorm
    bruno
    tailscale
    mono
    dotnet-sdk
    android-tools
    android-studio
    clang
    filezilla
    # freecad

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
    opencode

    # VR
    openxr-loader
    openxr-loader.dev
    vulkan-loader
    vulkan-tools
    libGL

    # Multi media
    obs-studio
    blender
    vlc
    ollama
    rmpc
    eden

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
    nix-ld
    p7zip
    mpc
    adw-gtk3
    deploy-rs
    xwayland-satellite

    # iPhone
    libimobiledevice
    ifuse
    gvfs
  ];
}
