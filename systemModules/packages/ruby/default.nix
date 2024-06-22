{lib, config, pkgs, ... }: with lib; {
	environment.systemPackages = with pkgs; [
    	    pkgs.ruby_3_3
    	    pkgs.bundler
    	    rubyPackages_3_3.jekyll
  	];        
}
