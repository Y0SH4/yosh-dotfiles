# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../modules/nvidia.nix
      # inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  }; 
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = ""; 
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tuxinity = {
    isNormalUser = true; 
    description = "tuxinity";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
     kitty
     brave
     fontconfig
     google-chrome
    ];
  };

  nixpkgs.config.allowUnfree = true;
   #Waybar wlr/Workspaces
    nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget 
  environment.systemPackages = with pkgs; [
    (python311.withPackages(ps: with ps; [ requests pyquery ]))
    gcc
    python311Packages.pip
    python311Full
    python3
    cava
    wireplumber
    pipewire
    wget
    rofi-wayland
    rofi mako rofimoji
    home-manager
    waybar 
    viewnior
    eww
    swww
    dunst
    libnotify
    pavucontrol
    wl-clipboard
    libsForQt5.polkit-kde-agent # authentication dialogue for GUI apps
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    qt6.full
    qt6.qtwayland
    qt6.qttools
    qt6.qtbase
    networkmanagerapplet
    libva
    playerctl
    pamixer
    jellyfin-ffmpeg
    libcanberra-gtk3
    blueman
    brightnessctl
    sway-contrib.grimshot
    xfce.thunar                               
    gnome.gnome-calculator
    wf-recorder
    vlc
    font-manager
    polychromatic
    firefox
    vscode
    dbeaver

    stylua
    lua-language-server
    nodePackages_latest.tailwindcss
    nodePackages_latest.eslint_d
    nodePackages_latest.prettier
    lazygit
  ]; 

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable= true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  hardware.openrazer.enable=true;
  hardware.openrazer.users=["tuxinity"];

  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # #ZSH Setup
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    interactiveShellInit = ''
      eval "$(starship init zsh)"
    '';
    ohMyZsh = {
      enable = true;
      plugins = [ 
        "git" 
        "colored-man-pages"
        "command-not-found"
        "extract"
        "nix"
      ];
      customPkgs = with pkgs ; [
        nix-zsh-completions
      ];
    };
  }; 

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fonts.fonts = with pkgs; [
   liberation_ttf
   font-awesome
   cantarell-fonts
   (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "CascadiaCode" ]; })
  ]; 
}
