{ pkgs, ... }: {
  home.packages = with pkgs; [
    broot
    btop
    neovim
    fuzzel
    alacritty
    rnote
    typesetter
    signal-desktop
    fend
    claws-mail
    # vnote
  ];
  programs.noctalia.enable = true;
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
  };
  programs.yazi.enable = true;
  programs.qutebrowser.enable = true;
  home.stateVersion = "26.05";
  programs.ssh.extraConfig = ''
      Host github.com
    	HostName github.com
    	User git
    	IdentityFile ~/.ssh/github-ssh
      Host *
    	HostName *
    	IdentityFile ~/.ssh/id_ed25519
  '';
  programs.git = {
    enable = true;
    settings.user = {
      name = "TheRedPillOw";
      email = "TheRedPillOw@github.com";
    };
  };
}
