{ pkgs, ... }:
{
  imports = [
    ../../system/darwin
  ];

  networking.hostName = "macbook";
  system.primaryUser = "loupa";

  users.users.loupa = {
    name = "loupa";
    home = "/Users/loupa";
    shell = pkgs.zsh;
  };

  # Used for backwards compatibility; read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
