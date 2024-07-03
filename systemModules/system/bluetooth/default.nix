{config, lib, ...}: with lib; {
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    services.pipewire.wireplumber.extraConfig = {
        "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
        };
    };
}
