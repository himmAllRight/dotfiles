# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  


  networking.hostName = "kadabra"; # Define your hostname.
  networking.hostId = "a8c04001";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
  # System  
    wget
    fish
    htop
    ncdu
    vim
    tmux
    unzip
    acpi
    acpitool
    xorg.xbacklight
    stow
    gptfdisk
    gparted

    zfs
    zfstools

  # Virt
    libvirt
    qemu
    kvm
    virtmanager
    vagrant
    lxc

  # Dev
    git
    emacs
    clojure
    leiningen

  # DM/WM
    i3-gaps
    i3blocks-gaps
    rofi
    rofi-pass
    dmenu
    
  # Fonts
    hack-font
    font-awesome-ttf

  # Desktop
    tdesktop
    quasselClient
    firefox
    thunderbird
    pass
    gnupg
    kgpg
    owncloud-client ## Nextcloud?
    mpv
    youtube-dl
    
  ];

  # List services that you want to enable:
  
  powerManagement.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.layout = "us";
   # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Virt
  virtualisation.libvirtd.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.ryan = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "libvirtd" "networkmanager" ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
