{ lib, system, ... }:
{
  imports =
    [
      ./dotfiles.nix
      ./packages.nix
      ./zed.nix
      ./ghostty.nix
      ./zsh.nix
    ]
    ++ lib.optionals (!lib.hasSuffix "darwin" system) [
      ./mpd.nix
      ./gtk.nix
      ./niri.nix
      ./noctalia.nix
    ];
}
