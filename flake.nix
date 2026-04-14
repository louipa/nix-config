{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      nix-darwin,
      home-manager,
      auto-cpufreq,
      stylix,
      nix-sweep,
      nur,
      cursor,
      affinity-nix,
      agenix,
      deploy-rs,
      lanzaboote,
      ghostty,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      flake =
        let
          overlays = [ nur.overlays.default ];

          mkPkgs =
            system:
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
              inherit overlays;
            };

          mkHomeManagerConfig =
            system:
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs system; };
              home-manager.users.loupa = import ./home/home.nix;
            };

          mkDesktopSystem =
            {
              system ? "x86_64-linux",
              hostPath,
            }:
            nixpkgs.lib.nixosSystem {
              inherit system;
              pkgs = mkPkgs system;
              specialArgs = {
                inherit cursor affinity-nix;
              };
              modules = [
                hostPath
                auto-cpufreq.nixosModules.default
                home-manager.nixosModules.home-manager
                stylix.nixosModules.stylix
                nix-sweep.nixosModules.default
                agenix.nixosModules.default
                lanzaboote.nixosModules.lanzaboote
                (mkHomeManagerConfig system)
              ];
            };

          mkServerSystem =
            {
              system ? "x86_64-linux",
              hostPath,
            }:
            nixpkgs.lib.nixosSystem {
              inherit system;
              pkgs = mkPkgs system;
              modules = [
                hostPath
                agenix.nixosModules.default
                nix-sweep.nixosModules.default
              ];
            };

          mkDarwinSystem =
            {
              system ? "aarch64-darwin",
              hostPath,
            }:
            nix-darwin.lib.darwinSystem {
              inherit system;
              pkgs = mkPkgs system;
              specialArgs = { inherit ghostty; };
              modules = [
                hostPath
                home-manager.darwinModules.home-manager
                nix-homebrew.darwinModules.nix-homebrew
                {
                  nix-homebrew = {
                    enable = true;
                    enableRosetta = true;
                    user = "loupa";
                    taps = {
                      "homebrew/homebrew-core" = homebrew-core;
                      "homebrew/homebrew-cask" = homebrew-cask;
                    };
                    mutableTaps = false;
                  };
                }
                (mkHomeManagerConfig system)
              ];
            };
        in
        {
          nixosConfigurations = {
            yoga = mkDesktopSystem { hostPath = ./hosts/yoga; };
            homelab = mkServerSystem { hostPath = ./hosts/homelab; };
          };

          darwinConfigurations = {
            macbook = mkDarwinSystem { hostPath = ./hosts/macbook; };
          };

          deploy.nodes.homelab = {
            hostname = "192.168.122.203";
            profiles.system = {
              sshUser = "loupa";
              user = "root";
              path = deploy-rs.lib.x86_64-linux.activate.nixos inputs.self.nixosConfigurations.homelab;
            };
          };
        };

      perSystem =
        { system, ... }:
        {
          checks = nixpkgs.lib.optionalAttrs (nixpkgs.lib.hasSuffix "-linux" system) (
            deploy-rs.lib.${system}.deployChecks inputs.self.deploy
          );
        };
    };
}
