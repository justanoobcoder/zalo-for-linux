{
  description = "An unofficial, community-driven port of the Zalo desktop application for Linux only.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.callPackage ./nix/default.nix { nixpkgs = pkgs; };
      }
    );
}
