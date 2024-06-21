{lib, config, pkgs, ... }: with lib; {
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
            "io.github.hmlendea.geforcenow-electron" # Geforce Now
            "md.obsidian.Obsidian" # Obsidian
            "eu.betterbird.Betterbird" # Betterbird
            "com.ulduzsoft.Birdtray" # Birdtray
            "io.gpt4all.gpt4all" #GPT4ALL
            "org.libretro.RetroArch" #RetroArch
        ];
    };
}