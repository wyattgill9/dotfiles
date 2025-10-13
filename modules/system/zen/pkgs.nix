{ pkgs, ...} :
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    neovim

    git

    perf      
    foot
    curl
  ];
 
  # environment.variables.PATH = "${pkgs.clang-tools}/bin:$PATH";
}
