{ lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$line_break"
        "$time"
        "$character"
      ];
      
      add_newline = true;
      scan_timeout = 10;
      command_timeout = 100;
      
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
      
      username = {
        format = "[$user]($style) ";
        style_user = "blue bold";
        show_always = true;
      };
      
      hostname = {
        format = "on [$hostname](bold yellow) ";
        ssh_only = false;
      };
      
      directory = {
        format = "in [$path]($style) ";
        style = "bold cyan";
        truncation_length = 2;
        truncate_to_repo = true;
      };
      
      git_branch = {
        format = "via [$branch]($style) ";
        style = "bold purple";
      };
      
      git_status = {
        format = ''([\[$all_status\]]($style) )'';
        style = "bold red";
        modified = "!";
        staged = "+";
        stashed = "📦";
        untracked = "?";
      };
      
      time = {
        format = "\\[ $time \\] ";
        time_format = "%H:%M:%S";
        style = "bold dimmed white";
        disabled = false;
      };
      
      line_break = {
        disabled = false;
      };
    };
  };
}
