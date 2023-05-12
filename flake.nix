{
  description = "Home Manager configuration of mine";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
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
      # pkgs = nixpkgs.legacyPackages.${system} // {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
        overlays = [ nixgl.overlay ];
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
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
