{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "wyattgill9";
        email = "wyattgill01@outlook.com";
      };
    };
  };

  home.packages = with pkgs; [
    lazyjj
  ];
}
