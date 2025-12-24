{ ... }:
{
  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    icon_theme = "Material Icon Theme";
    ui_font_size = 16;
    buffer_font_size = 15;
    theme = {
      mode = "dark";
      light = "One Light";
      dark = "Tokyo Night Light";
    };
    load_direnv = "shell_hook";
    languages = {
      PHP = {
        format_on_save = "off";
      };
    };
  };
}
