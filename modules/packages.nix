{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    hyfetch	    
    fish
    gotop
    git
    networkmanagerapplet
    neovim
    ungoogled-chromium
    dolphin
    nextcloud-client
    vscode-with-extensions
    libreoffice-qt6-fresh
    tailscale
    flatpak
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
