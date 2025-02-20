{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim 
    neovim 
    # TODO: try to remove fish
    fish 
    fastfetch
    # TODO: Move upper ones to home-manager

    any-nix-shell
    which
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man 
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    tinycc
    openssh
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Europe/Rome";

  # you can configure home-manager in here like
  #home-manager = {
  #  useGlobalPkgs = true;
  
  #  config =
  #    { config, lib, pkgs, ... }:
  #    {
  #      # Read the changelog before changing this value
  #      home.stateVersion = "24.05";
  
        # insert home-manager config
  #    };
  #};
  # set fish as default
  user.shell = "${pkgs.fish}/bin/fish";

  # WARN: Unsure if next line is necessary
  home-manager.useGlobalPkgs = true;
  home-manager.config = ./home.nix;

  # Enable access to storage
  android-integration.termux-setup-storage.enable = true;
}
