{
  description = "Nix flake for the kori compiler toolchain.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zig-flake = {
      url = "github:silversquirl/zig-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zig-flake }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
        ] (system:
          function (import nixpkgs {
            inherit system;

            overlays = [
              (_: _: {
                zig = zig-flake.packages.${system}.zig_0_15_2;
              })
            ];
          }));
    in {
      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/devShell.nix {};
      });
    };
}
