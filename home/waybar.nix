{ inputs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.main = {
      layer = "top";
      margin-top = 5;
      margin-left = 5;
      margin-right = 5;
      modules-left = [
        "niri/window"
        "wlr/taskbar"
      ];
      modules-center = [
        "clock#date"
        "clock"
      ];
      modules-right = [
        "tray"
        "pulseaudio"
        "battery"
        "custom/poweroff"
      ];

      "niri/window" = {
        format = "{title}";
      };

      "wlr/taskbar" = {
        format = "{icon}";
        tooltip-format = "{title} | {app_id}";
        on-click = "activate";
        icon-size = 14;
      };

      clock = {
        interval = 1;
        format = " {:%H:%M:%S}";
      };

      "clock#date" = {
        format = "󰃭 {:%d/%m/%Y}";
      };

      tray = {
        icon-size = 14;
        spacing = 12;
      };

      pulseaudio = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        format-bluetooth-muted = " {icon}";
        format-muted = "";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "󰏳";
          headset = "󰋎";
          phone = "";
          portable = "";
          car = "";
          default = [
            ""
            ""
            ""
          ];
        };
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% 󰢜";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };

      "custom/poweroff" = {
        format = "⏻";
        tooltip = "Desligar";
        on-click = "poweroff";
      };

    };

    style = ''
      @import "${inputs.catppuccin-waybar}/themes/mocha.css";

      * {
        color: @text;
      }

      window#waybar {
          background: transparent;
      }

      #window,#clock.date,#tray,#taskbar,#clock,#pulseaudio,#battery,#custom-poweroff {
        background-color: shade(@base, 0.9);
        padding-left: 10px;
        padding-right: 10px;
      }

      #window,#clock.date,#tray {
        border-top-left-radius: 999px;
        border-bottom-left-radius: 999px;
      }

      #taskbar,#clock,#custom-poweroff {
        border-top-right-radius: 999px;
        border-bottom-right-radius: 999px;
      }

      #clock.date {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
      }


      #taskbar button {
        padding: 0;
        padding-right: 12px;
      }

      #taskbar button:last-child {
        padding-right: 0;
      }
    '';
  };
}
