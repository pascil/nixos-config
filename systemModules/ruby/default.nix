{lib, config, pkgs, ... }: with lib; {
    options = {
        modules.system.ruby.enable = lib.mkEnableOption "System Ruby configuration";
    };

    config = lib.mkIf config.modules.system.template.enable {
	environment.systemPackages = with pkgs; [
    	    pkgs.ruby_3_3
    	    pkgs.bundler
    	    rubyPackages_3_3.jekyll
  	];        
    };
}
