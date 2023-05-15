{ config, pkgs, nixgl, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alessandrodalfovo";
  home.homeDirectory = "/home/alessandrodalfovo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    slack
    tdesktop
    kitty
    alacritty
    spotify
    discord
    _1password
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./nixgl.nix
    ./programs/firefox.nix
    ./programs/git.nix
  ];

  home.file = {
    "./config/alacritty/alacritty.yml".source = ./programs/config/alacritty.yml;
  };

}
