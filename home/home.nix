{ ... }:

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

  programs.home-manager.enable = true;
}
