{ ... }:
{
  services.flatpak = {
    packages = [
      "dev.vencord.Vesktop"
      "app.zen_browser.zen"
      "com.slack.Slack"
      "io.dbeaver.DBeaverCommunity"
      "org.filezillaproject.Filezilla"
      "org.prismlauncher.PrismLauncher"
      "org.onlyoffice.desktopeditors"
      "io.github.mfat.sshpilot"
      "org.keepassxc.KeePassXC"
      "org.chromium.Chromium"
      "com.valvesoftware.Steam"
      "org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/25.08"
      "com.obsproject.Studio"
    ];
    overrides = {
      "app.zen_browser.zen".Context = {
        filesystems = [
          "/home/takasaki/Downloads:rw"
        ];
      };

      "dev.vencord.Vesktop".Context = {
        filesystems = [
          "/home/takasaki/Downloads:rw"
        ];
      };

      "com.slack.Slack".Context = {
        filesystems = [
          "/home/takasaki/Downloads:rw"
        ];
      };

      "org.chromium.Chromium".Context = {
        filesystems = [
          "/home/takasaki/Downloads:rw"
        ];
      };

    };
  };
}
