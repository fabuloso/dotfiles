{ config, pkgs, nixgl, lib, ... }:
let inherit (builtins) readDir attrNames;
in
{
  home = { packages = [ pkgs.nixgl.nixGLIntel ]; };

  nixpkgs.overlays =
    let
      nixgl_stuff = (self: super: {
        nixglWrapper = drv:
          pkgs.symlinkJoin {
            name = (drv.name + "-nixGLWrapper");
            paths = (map
              (bin:
                pkgs.writeShellScriptBin bin ''
                  exec ${self.nixgl.nixGLIntel}/bin/nixGLIntel ${drv}/bin/${bin} "$@"
                '')
              (attrNames (readDir "${drv}/bin"))) ++ [ drv ];
          };

        alacritty = self.nixglWrapper super.alacritty;
        kitty = self.nixglWrapper super.kitty;
        tdesktop = self.nixglWrapper super.tdesktop;
        firefox = self.nixglWrapper super.firefox;
      });
    in
    [ nixgl.overlay nixgl_stuff ];
}
