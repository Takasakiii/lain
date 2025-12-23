{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    helix
    fuzzel
    zed-editor-fhs
    android-studio
    xwayland-satellite
    nautilus
    vscode
    mpvpaper
    jetbrains.idea
    wl-clipboard
    xclip
    xsel
    cliphist
    nixd
    nil
    bluetui
    distrobox
    power-profiles-daemon
  ];
}
