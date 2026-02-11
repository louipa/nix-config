{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wget
    gedit
    git
    sshpass
    mkcert
    unzip
  ];
}
