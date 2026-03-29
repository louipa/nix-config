{ ... }:
{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      general = {
        avatarImage = "/home/loupa/.face";
      };
      location = {
        use12hourFormat = false;
      };
      colorSchemes = {
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
      };
    };
  };
}
