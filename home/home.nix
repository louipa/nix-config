{ pkgs, ... }:

{

  home = {
    username = "loupa";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/loupa" else "/home/loupa";
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
