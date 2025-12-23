{ inputs, ... }:
{
  home-manager.users.takasaki =
    { ... }:
    {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.dankMaterialShell.homeModules.dank-material-shell
        inputs.dankMaterialShell.homeModules.niri
        ./niri.nix
        ./flatpaks.nix
      ];

      programs = {
        dank-material-shell = {
          enable = true;
          systemd.enable = true;
          quickshell.package = inputs.quickshell.packages.x86_64-linux.quickshell;
        };
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
      };

      xdg.configFile."fuzzel/fuzzel.ini".text = ''
        include=${inputs.catppuccin-fuzzel}/themes/catppuccin-mocha/blue.ini
      '';
      home.stateVersion = "25.11";
    };
}
