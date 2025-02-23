{
  description = "Minimal example of Nix-on-Droid system config with home-manager.";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nix-on-droid-unstable = {
      url = "github:nix-community/nix-on-droid/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager-unstable";
    };

  };

  outputs = inputs@{ self, ... } : {

    

    nixOnDroidConfigurations.default = inputs.nix-on-droid-unstable.lib.nixOnDroidConfiguration {
      pkgs = import inputs.nixpkgs-unstable { system = "aarch64-linux"; };
      modules = [ ./nix-on-droid.nix ];
    };

  };
}
