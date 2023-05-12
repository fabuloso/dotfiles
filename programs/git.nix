{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
    aliases = {
      "ga" = "add .";
      "gc" = "commit -m";
      "gst" = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
