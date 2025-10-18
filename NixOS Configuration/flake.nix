{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      Libertas = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs outputs;
          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };
        };
        modules = [
          ./os/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.hesprs = { pkgs, ... }: {
                imports = [./home/home.nix];
              };
              backupFileExtension = "bak";
            };
          }
        ];
      };
    };
  };
}
