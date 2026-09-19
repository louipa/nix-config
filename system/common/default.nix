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
    extra-substituters = [ "https://cache.forall.systems" ];
    extra-trusted-public-keys = [
      "cache.forall.systems:5PmD7QO4MSF8YgyRZtkSGXRDo96H3bybIf2SsQh8ScI="
    ];
  };
}
