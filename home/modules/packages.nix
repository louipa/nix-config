{ pkgs, lib, ... }:
{
  home.packages =
    with pkgs;
    [
      wget
      git
      sshpass
      mkcert
      unzip
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      gedit
    ];
}
