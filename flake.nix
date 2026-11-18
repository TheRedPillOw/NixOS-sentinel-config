{
  description = "Sentinel config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager"; 
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = {
    self, nixpkgs, nixos-hardware, home-manager, ...
  }@inputs: {
    nixosConfigurations.sentinel = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        # nixos-hardware.nixosModules.microsoft-surface-pro-intel
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.trp0 = import ./home.nix;
        }
      ];
    };
  };
}
