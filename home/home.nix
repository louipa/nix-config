{
  config,
  pkgs,
  lib,
  ...
}:

{

  home = {
    username = "loupa";
    homeDirectory = "/home/loupa";
    stateVersion = "24.11";
  };

  imports = [
    ./modules
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      speed = 0.4;
    };
  };

  programs.home-manager.enable = true;
}
