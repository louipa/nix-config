{ ... }:
{
  imports = [
    ../../system/darwin
  ];

  networking.hostName = "macbook";

  # Used for backwards compatibility; read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
