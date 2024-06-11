{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    fish
    wget
    alejandra
    hyfetch
    gotop
    git
    distrobox
    boxbuddy
    networkmanagerapplet
    networkmanager-openvpn
    networkmanager-vpnc
    kdePackages.networkmanager-qt
    neovim
    mpv
    ungoogled-chromium
    librewolf
    tor-browser
    gimp
    nextcloud-client
    vscode-with-extensions
    libreoffice-qt6-fresh
    tailscale
    vesktop
    element-desktop
    signal-desktop
    simplex-chat-desktop
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
