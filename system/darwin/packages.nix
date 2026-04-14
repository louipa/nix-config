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
    orbstack
    vscode
    
    localsend
    obsidian
    slack
  ];
}