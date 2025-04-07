# SPDX-FileCopyrightText: 2025 The Hurdle Developers
#
# SPDX-License-Identifier: GPL-2.0-only

{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = { self, flake-utils, naersk, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        naersk' = pkgs.callPackage naersk {};

      in rec {
        # For `nix build` & `nix run`:
        packages.default = naersk'.buildPackage {
          src = ./.;
          nativeBuildInputs = with pkgs; [ pkg-config cmake ] ;
          buildInputs = with pkgs; [
            systemd.dev
            dbus.dev
            seatd.dev
          ];
        };

        # For `nix develop`:
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ rustc cargo pkg-config cmake ];
          inputsFrom = [ self.packages.${system}.default ];
        };
      }
    );
}
