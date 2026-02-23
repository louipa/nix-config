{
  imports = [
    ./boot.nix
    ./secureboot.nix
    ./agenix.nix
    ./networking.nix
    ./fonts.nix
    ./i8n.nix
    ./docker.nix
    ./user.nix
    ./printing.nix
    ./cleanup.nix
    ./ai.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
