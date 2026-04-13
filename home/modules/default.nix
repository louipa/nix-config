{ pkgs, ... }:
{
  imports =
    [
      ./dotfiles.nix
      ./packages.nix
      ./zed.nix
      ./ghostty.nix
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
      ./mpd.nix
      ./gtk.nix
      ./niri.nix
      ./noctalia.nix
    ];
}
