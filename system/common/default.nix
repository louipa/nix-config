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
  };
}
