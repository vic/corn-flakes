{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = (inputs: 
  let 
    darwinPkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
  in
  {
    packages.aarch64-darwin.patito = darwinPkgs.hello;
    devShells.aarch64-darwin.default = with darwinPkgs; mkShell {
      buildInputs = [ mill ];
    };
    devShells.aarch64-darwin.devops = with darwinPkgs; mkShell {
      buildInputs = [ terraform kubectl fish ];
    };
  });
}
