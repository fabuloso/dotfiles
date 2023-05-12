{ config, lib, pkg, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 11;
      shell.program = "/usr/bin/zsh";
    };
  };
}
