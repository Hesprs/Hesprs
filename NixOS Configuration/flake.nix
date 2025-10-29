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
  };

  outputs =
    {
      self,
      nixpkgs-unstable,
      nixpkgs-bak1,
      nixpkgs-bak2,
      nixpkgs-bak3,
      home-manager,
      zen-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs-bak1 = import inputs.nixpkgs-bak1;
      pkgs-bak2 = import inputs.nixpkgs-bak2;
      pkgs-bak3 = import inputs.nixpkgs-bak3;
      pkgs-unstable = import inputs.nixpkgs-unstable;
    in
    {
      nixosConfigurations.Libertas = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./os/configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              (final: prev: {
                bak1 = pkgs-bak1 {
                  inherit system;
                  config = prev.config;
                  overlays = prev.overlays;
                };
              })
              (final: prev: {
                bak2 = pkgs-bak2 {
                  inherit system;
                  config = prev.config;
                  overlays = prev.overlays;
                };
              })
              (final: prev: {
                bak3 = pkgs-bak3 {
                  inherit system;
                  config = prev.config;
                  overlays = prev.overlays;
                };
              })
              (final: prev: {
                zen = inputs.zen-browser.packages.${system}.default;
              })
            ];
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
