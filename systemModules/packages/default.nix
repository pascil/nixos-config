{pkgs, config, lib, ...}: with lib; {
    nixpkgs.config = {
      allowUnfree = true;
    };
  
    environment.systemPackages = with pkgs; [
      sops
      age
      ssh-to-age
      lm_sensors
      wget
      gcc
      ruby
      unzip
      zip
      which
      alejandra
      hyfetch
      gotop
      git
      distrobox
      neovim
      yarn
    ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      font-awesome
      powerline-fonts
      powerline-symbols
    ];
}
