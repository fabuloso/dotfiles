{ config, pkgs, nixgl, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alessandrodalfovo";
  home.homeDirectory = "/home/alessandrodalfovo";

  home.stateVersion = "22.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nerdfonts
    bitwarden
    bitwarden-cli
    slack
    tdesktop
    kitty
    ripgrep
    alacritty
    vscode
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
