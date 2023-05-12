{ config, lib, pkg, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = lib.attrsets.recursiveUpdate (import ./config/alacritty.nix) {
      shell.program = "/usr/bin/zsh";
    };
  };
}
