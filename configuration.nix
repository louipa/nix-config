{
  imports = [
    ./system/core
    ./system/desktop
    ./system/packages.nix
  ];

  nix.settings = {
    substituters = [
      "https://cache.garnix.io"
    ];

    trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
