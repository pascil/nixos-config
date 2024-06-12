{pkgs, ...}: {
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "io.github.unknownskl.greenlight" # Greenlight
      "org.libreoffice.LibreOffice" # LibreOffice
      "md.obsidian.Obsidian" # Obsidian
      "eu.betterbird.Betterbird" # Betterbird
      "com.ulduzsoft.Birdtray" # Birdtray
      "io.gpt4all.gpt4all" #GPT4ALL
      "org.libretro.RetroArch" #RetroArch
    ];
  };
}
