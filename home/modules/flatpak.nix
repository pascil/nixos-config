{pkgs, ...}:

{
 
  services.flatpak = {
     enable = true;
     update.onActivation = true;
     remotes = lib.mkOptionDefault [{
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";

     }];
     packages = [
       "io.github.unknownskl.greenlight"
     ];
  };

}
