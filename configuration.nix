# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./home.nix
    ];


  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "lain";
    networkmanager.enable = true;
    firewall = {
      allowedUDPPorts = [
        19132
      ];
    };
  }; 

  nixpkgs = {
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };
  
  users = {
    extraUsers.takasaki.shell = pkgs.zsh;
    users.takasaki = {
      isNormalUser = true;
      home = "/home/takasaki";
      extraGroups = [
        "wheel"
        "kvm"
      ];
    };
  };
  
  

  programs = {
    niri.enable = true;
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "direnv"
        ];
        theme = "robbyrussell";
      };
    };
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 2d --keep 3";
      };
      flake = "/home/takasaki/lain";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      alacritty
      helix
      fuzzel
      zed-editor-fhs
      android-studio
      xwayland-satellite
      nautilus
      vscode
      mpvpaper
      jetbrains.idea-ultimate
      wl-clipboard
      xclip
      xsel
      cliphist
      nixd
      nil
      bluetui
      distrobox
    ];

    sessionVariables.TZ = config.time.timeZone;
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };

      open = true;
      nvidiaSettings = true;
      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };

      package = config.boot.kernelPackages.nvidiaPackages.beta; 
    };
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    nvidia-container-toolkit.enable = true;
  };

  services = {
    xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];
    flatpak.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

   

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


  systemd.user.services.niri-flake-polkit.enable = false;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8"; 

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  system.stateVersion = "26.05"; # Did you read the comment?

}

