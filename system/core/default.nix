{
  imports = [
    ./boot.nix
    ./networking.nix
    ./fonts.nix
    ./i8n.nix
    ./user.nix
    ./printing.nix
    ./cleanup.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
