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
    ansible
    poetry
    python3Packages.hvac
    go
    vscodium

    rectangle
    betterdisplay
    maccy

    nodejs_24
    pnpm
    docker-compose
    vscode
    opencode
    tsx
    restic
    awscli2
    gopass
    vault
    
    localsend
    obsidian
    slack
  ];
}
