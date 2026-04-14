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
    lazyssh

    rectangle
    betterdisplay

    nodejs_25
    pnpm
    docker-compose
    vscode
    
    localsend
    obsidian
    slack
  ];
}