{ config, pkgs, nixgl, ... }:

{
  home.username = "alessandrodalfovo";
  home.homeDirectory = "/home/alessandrodalfovo";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    btop
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
    zoxide
    zsh
    tig
    lsd
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
    "./.config/alacritty/alacritty.yml".source = ./programs/config/alacritty.yml;
    "./.config/kitty".source = ./programs/config/kitty;
  };

}
