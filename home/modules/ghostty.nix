{ lib, system, ... }:
let
  isDarwin = lib.hasSuffix "darwin" system;
in
{
  programs.ghostty = lib.mkIf (!isDarwin) {
    enable = true;
    settings = {
      font-size = 12;
      selection-background = "#44475a";
      selection-foreground = "#ffffff";
    };
  };

  xdg.configFile."ghostty/config" = lib.mkIf isDarwin {
    text = ''
      font-size = 14
      selection-background = #44475a
      selection-foreground = #ffffff
    '';
  };
}
