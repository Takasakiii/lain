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
        ./programs.nix
      ];

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
