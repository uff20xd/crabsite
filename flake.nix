{
  description = "Flake for my website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = forAllSystems (
        system: 
        import nixpkgs {
          inherit system;
        }
      );
in 
  {

    devShells = forAllSystems (system: {
      default = pkgsFor.${system}.callPackage ./shell.nix { };
    });
  };
}
