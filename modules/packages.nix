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
  ];
}
