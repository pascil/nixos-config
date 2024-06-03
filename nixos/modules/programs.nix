{ pkgs, ... }: {

 programs.fish = {
   enable = true;
 };

 programs.chromium = {
   enable = true;
   extensions = [ 
     "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
     "fnaicdffflnofjppbagibeoednhnbjhg" # floccus bookmarks sync
     "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
     "oldceeleldhonbafppcapldpdifcinji" # LanguageTool
     "cimiefiiaegbelhefglklhhakcgmhkai" # KDE Plasma Browser Integration
     "nfkmalbckemmklibjddenhnofgnfcdfp" # YouTube Channel Blocker
   ];
 };
}
