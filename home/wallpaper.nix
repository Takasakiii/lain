{ pkgs, ... }:
{
  systemd.user.services.wallpaper = {
    Unit = {
      Description = "Wallpaper video";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.mpvpaper}/bin/mpvpaper ALL -o \"no-audio --no-keepaspect --panscan=1 --loop-playlist\" /home/takasaki/Downloads/aiscream-ai-sukuri-mu-official-lyric-video_video_1440p_japanese.mp4";
      Restart = "on-failure";
      RestartSec = "5s";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
