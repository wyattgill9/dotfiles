{ ... }:
let
  homePath = ../../home;
in
{
  imports = [
    (homePath + /terminal)
  ];
 
  home.username = "wyattgill";
  home.homeDirectory = "/Users/wyattgill";
  home.stateVersion = "25.05";
  
  programs.home-manager.enable = true;
}
