{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Dev

    # CLI utils
    hyfetch	    
    fish
    gotop
    git
    
    neovim
    ungoogled-chromium
    dolphin
    nextcloud-client
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
     nerdfonts
  ];
}
