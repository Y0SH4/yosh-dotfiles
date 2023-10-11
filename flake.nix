{
  description = "Yosh Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    # system = "x86_64-linux";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config = {
    #     allowUnfree = true;
    #   };
    # };
    inherit (self) outputs;
  in

  {
    nixosConfigurations = {
      os = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      home = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [./home-manager/home.nix];
      };
    };
  };
}
