{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-sweep = {
      url = "github:jzbor/nix-sweep";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    cursor.url = "github:TudorAndrei/cursor-nixos-flake";
    affinity-nix.url = "github:mrshmllow/affinity-nix";
    nixai.url = "github:olafkfreund/nix-ai-help";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      auto-cpufreq,
      stylix,
      nix-sweep,
      nur,
      cursor,
      affinity-nix,
      nixai,
      agenix,
      ...
    }:
    let

      system = "x86_64-linux";

      overlays = [
        # NUR overlay
        nur.overlays.default
      ];

      homeManagerConfig = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.loupa = import ./home/home.nix;
      };

      mkNixosSystem =
        { hostPath }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
            overlays = overlays;
          };

          specialArgs = {
            inherit cursor;
            inherit affinity-nix;
          };

          modules = [
            hostPath
            auto-cpufreq.nixosModules.default
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            nix-sweep.nixosModules.default
            nixai.nixosModules.default
            agenix.nixosModules.default
            homeManagerConfig
          ];
        };
    in
    {
      nixosConfigurations.laptop = mkNixosSystem { hostPath = ./hosts/laptop; };
    };
}
