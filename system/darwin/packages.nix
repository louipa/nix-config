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

    nodejs_25
    pnpm
    docker-compose
    vscode
    
    localsend
    obsidian
    slack
  ];
}