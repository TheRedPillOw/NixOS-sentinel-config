{pkgs, ...}:{
  home.packages = with pkgs; [
	broot
btop 
neovim
];
home.stateVersion = "26.05";
}
