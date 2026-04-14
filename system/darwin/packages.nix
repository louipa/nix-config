{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    mkcert
    openvpn
    gnupg

    nodejs_25
    pnpm

    localsend
    obsidian
    slack
  ];
}