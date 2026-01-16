{ inputs, pkgs, ... }:
{
  home-manager.users.takasaki =
    { ... }:
    {
      imports = [
        ./niri.nix
        ./waybar.nix
        ./wallpaper.nix
        ./zed.nix
      ];

      programs = {

        direnv = {
          enable = true;
          enableZshIntegration = true;
          enableBashIntegration = true;
          nix-direnv.enable = true;
        };
        git = {
          enable = true;
          settings = {
            user = {
              email = "lucasmc2709@live.com";
              name = "Takasakiii";
            };
            init.defaultBranch = "main";
          };
        };
        emacs = {
          enable = true;
          extraPackages =
            epkgs: with epkgs; [
              treesit-grammars.with-all-grammars
            ];
        };
      };

      xdg.configFile."fuzzel/fuzzel.ini".text = ''
        include=${inputs.catppuccin-fuzzel}/themes/catppuccin-mocha/blue.ini
      '';

      services.network-manager-applet = {
        enable = true;
      };

      gtk = {
        enable = true;
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
      };

      home.stateVersion = "25.11";
    };
}
