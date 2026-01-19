# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./home/home.nix
    ./packages.nix
    ./flatpaks.nix
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
      allowedTCPPorts = [
        25565
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
    zsh.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 2d --keep 3";
      };
      flake = "/home/takasaki/lain";
    };
    nix-ld.dev.enable = true;
  };

  environment = {
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
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    power-profiles-daemon = {
      enable = true;
    };
    kubo = {
      enable = true;
      package = pkgs-unstable.kubo;
    };
    clipboard-sync.enable = true;
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

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
    ];
  };

  system.stateVersion = "26.05"; # Did you read the comment?

}
