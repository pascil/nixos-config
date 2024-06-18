{pkgs, config, lib, outputs, ...}: with lib; {
  options = {
    modules.system.packages.enable = mkEnbaleOption "Enable root packages";
  };

  config = lib.mkIf config.modules.system.packages.enable {
    nixpkgs.overlays = [outputs.overlays.addPackages];

    nixpkgs.config = {
      allowUnfree = true;
    };
  
    environment.systemPackages = with pkgs; [
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
      tailscale
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

    programs.fish.enable = true;
  
  };
}
