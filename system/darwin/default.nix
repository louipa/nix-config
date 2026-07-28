{
  imports = [
    ./settings.nix
    ./packages.nix
    ./homebrew.nix
    ./zsh.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
