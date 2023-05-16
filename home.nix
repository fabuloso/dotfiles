{ config, pkgs, nixgl, ... }:

{
  home.username = "alessandrodalfovo";
  home.homeDirectory = "/home/alessandrodalfovo";

  home.stateVersion = "22.11";

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
