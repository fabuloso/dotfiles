{
  description = "Home Manager configuration of mine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixgl, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system} // {
        inherit system;
        config = { allowUnfree = true; };
      };
    in
    {
      homeConfigurations."alessandrodalfovo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs =
          {
            inherit nixgl;
            dotfiles = self;
          };
        modules = [ ./home.nix ];
      };
    };
}
