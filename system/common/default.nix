{
  imports = [
    ./user.nix
    ./i8n.nix
    ./networking.nix
    ./agenix.nix
    ./tailscale.nix
    ./docker.nix
    ./cleanup.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://cache.garnix.io" ];
    trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };
}
