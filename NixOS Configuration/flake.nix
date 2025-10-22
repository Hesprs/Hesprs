{
  description = "Your new nix config";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-bak1.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-bak2.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-bak3.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs-bak1,
    nixpkgs-bak2,
    nixpkgs-bak3,
    home-manager,
    zen-browser,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs-bak1 = import inputs."nixpkgs-bak1" { inherit system; };
    pkgs-bak2 = import inputs."nixpkgs-bak2" { inherit system; };
    pkgs-bak3 = import inputs."nixpkgs-bak3" { inherit system; };
    pkgs-unstable = import inputs."nixpkgs-unstable" { inherit system; };
  in {
    nixosConfigurations.Libertas = nixpkgs-unstable.lib.nixosSystem {
      inherit system;
      modules = [
        ./os/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [
            (final: prev: {
              bak1 = import inputs."nixpkgs-bak1" {
                inherit system;
                config = prev.config;
                overlays = prev.overlays;
              };
            })
            (final: prev: {
              bak2 = import inputs."nixpkgs-bak2" {
                inherit system;
                config = prev.config;
                overlays = prev.overlays;
              };
            })
            (final: prev: {
              bak3 = import inputs."nixpkgs-bak3" {
                inherit system;
                config = prev.config;
                overlays = prev.overlays;
              };
            })
          ];
        }
        {
          home-manager = {
            users.hesprs = import ./home/home.nix;
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bak";
          };
        }
      ];
    };
  };
}
