{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  inputs.utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import "${nixpkgs}" {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        pandoc-amsthm = pkgs.python3Packages.buildPythonPackage {
          pname = "pandoc-amsthm";
          version = "2.0.0";
          format = "pyproject";
          src = pkgs.fetchFromGitHub {
            owner = "ickc";
            repo = "pandoc-amsthm";
            rev = "v2.0.0";
            sha256 = "sha256-hyXti/uM6y1HBZkbORgRh2HmY46vKH404647ktCRuL8=";
          };
          propagatedBuildInputs = with pkgs; [
            poetry
            python3Packages.panflute
          ];
        };
        deps = with pkgs; [
          texlive.combined.scheme-full
          pandoc
          haskellPackages.pandoc-crossref
          pandoc-amsthm
          librsvg
          gnumake
        ];
        fonts-conf = pkgs.makeFontsConf {
          fontDirectories = [
            pkgs.source-han-sans
            pkgs.edukai
          ];
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = deps;
          FONTCONFIG_FILE = fonts-conf;
        };
        defaultPackage = pkgs.stdenv.mkDerivation {
          name = "main.pdf";
          src = ./.;
          buildInputs = deps;
          buildPhase = "make";
          installPhase = ''
            mkdir -p $out
            cp main.pdf $out
          '';
          FONTCONFIG_FILE = fonts-conf;
        };
      });
}
