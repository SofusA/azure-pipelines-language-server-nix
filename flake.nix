{
  description = "A simple derivation for azure-pipelines-language-server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };


  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        azure-pipelines-language-server = pkgs.stdenv.mkDerivation {
          pname = "azure-pipelines-language-server";
          version = "0.8";

          src = pkgs.fetchFromGitHub {
            owner = "microsoft";
            repo = "azure-pipelines-language-server";
            rev = "main";
            sha256 = "sha256-etsrkVpRdvGxipa9TQ5cSvTYviIJBkSpjQJaMeuAtXc=";
          };

          buildInputs = [ pkgs.nodePackages.npm ];

          configurePhase = ''
            echo configure phase
            ls -a
          '';


          buildPhase = ''
            echo build phase
            ls src
          
            npm i -C src/azure-pipelines-language-server
            npm run build -C src/azure-pipelines-language-server
          '';

          installPhase = ''
            install -D build/src/azure-pipelines-language-server/dist/bin/azure-pipelines-language-server $out/bin/azure-pipelines-language-server
          '';
        };
      
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            azure-pipelines-language-server
          ];
        };
        
        packages.azure-pipelines-language-server = azure-pipelines-language-server;
      });
}
