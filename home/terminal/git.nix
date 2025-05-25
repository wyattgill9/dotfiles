{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Wyatt Gill";
    userEmail = "101477459+wyattgill9@users.noreply.github.com";
  };
}
