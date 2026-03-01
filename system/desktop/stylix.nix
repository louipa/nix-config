{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [ _0xproto ];
  stylix.enable = true;
  stylix.targets.qt.enable = false;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ../../assets/wallpaper/copyleft.png;
  stylix.opacity = {
    desktop = 0.9;
    applications = 0.9;
    terminal = 0.9;
    popups = 0.9;
  };
  stylix.cursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  stylix.targets.gnome.enable = true;

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };

}
