{ ... }:
{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "direnv"
        ];
        theme = "robbyrussell";
      };
    };

    mise = {
      enable = true;

      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
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
    emacs = {
      enable = true;
      extraPackages =
        epkgs: with epkgs; [
          treesit-grammars.with-all-grammars
        ];
    };
  };
}
