# SPDX-FileCopyrightText: 2025 The Hurdle Developers
#
# SPDX-License-Identifier: GPL-2.0-only

(import
  (
    let
      lock = builtins.fromJSON (builtins.readFile ./flake.lock);
      nodeName = lock.nodes.root.inputs.flake-compat;
    in
    fetchTarball {
      url = lock.nodes.${nodeName}.locked.url or "https://github.com/edolstra/flake-compat/archive/${lock.nodes.${nodeName}.locked.rev}.tar.gz";
      sha256 = lock.nodes.${nodeName}.locked.narHash;
    }
  )
  { src = ./.; }
).defaultNix
