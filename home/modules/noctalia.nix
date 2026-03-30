{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.noctalia-shell ];

  home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
    defaultWallpaper = "/etc/nixos/assets/wallpaper/copyleft.png";
    wallpapers = { };
  };

  home.activation.noctaliaSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/noctalia"
    $DRY_RUN_CMD cp --remove-destination ${../dotfiles/noctalia-settings.json} "$HOME/.config/noctalia/settings.json"
    $DRY_RUN_CMD chmod 644 "$HOME/.config/noctalia/settings.json"
  '';
}
