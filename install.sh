#! /run/current-system/sw/bin/bash
sudo sed -i "2i \  $1" "/etc/nixos/packages.nix"
sudo nixos-rebuild switch

