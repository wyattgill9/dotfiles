{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "wyattgill9";
        email = "101477459+wyattgill9@users.noreply.github.com";
      };
    };
  };

  home.packages = with pkgs; [
    lazyjj
  ];
}
