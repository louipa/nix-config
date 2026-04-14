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
    PNPM_HOME = "$HOME/.local/share/pnpm";
  };

  home.sessionPath = [
    "$HOME/.local/share/pnpm"
  ];

  programs.home-manager.enable = true;
}
