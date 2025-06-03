{ config, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # "$schema" = "https://starship.rs/config-schema.json";
      
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$kubernetes"
        "$docker_context"
        "$terraform"
        "$golang"
        "$python"
        "$nodejs"
        "$rust"
        "$java"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$battery"
        "$time"
        "$status"
        "$character"
      ];
      
      # Core prompt config
      add_newline = true;
      scan_timeout = 30;
      command_timeout = 500;
      
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[✗](bold red)";
        vimcmd_symbol = "[❮](bold green)";
      };
      
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      
      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold yellow) ";
        disabled = false;
      };
      
      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        style = "bold cyan";
        read_only = " 🔒";
        read_only_style = "red";
        format = "in [$path]($style)[$read_only]($read_only_style) ";
      };
      
      git_branch = {
        symbol = " ";
        format = "via [$symbol$branch]($style) ";
        style = "bold purple";
      };
      
      git_status = {
        format = ''([\[$all_status$ahead_behind\]]($style) )'';
        style = "bold red";
        conflicted = "⚔️";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        untracked = "?\${count}";
        stashed = "📦";
        modified = "!\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "✘\${count}";
      };

      git_state = {
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        style = "bright-black";
      };
      
      kubernetes = {
        symbol = "☸ ";
        format = "via [$symbol$context( \\($namespace\\))]($style) ";
        style = "bold blue";
        disabled = false;
      };
      
      docker_context = {
        symbol = "🐳 ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        disabled = false;
      };
      
      terraform = {
        symbol = "💠 ";
        format = "via [$symbol$workspace]($style) ";
        style = "bold 105";
        disabled = false;
      };
      
      golang = {
        symbol = "🏎💨 ";
        format = "via [$symbol($version )]($style)";
        style = "bold cyan";
      };
      
      python = {
        symbol = "🐍 ";
        format = "via [$symbol$pyenv_prefix($version)( \\($virtualenv\\))]($style) ";
        style = "bold yellow";
        python_binary = [ "python3" "python" ];
        detect_extensions = [ "py" ];
        detect_files = [ "requirements.txt" "pyproject.toml" "Pipfile" "tox.ini" "setup.py" ];
      };
      
      nodejs = {
        symbol = "⬢ ";
        format = "via [$symbol($version )]($style)";
        style = "bold green";
        detect_files = [ "package.json" ".node-version" ];
        detect_extensions = [ "js" "mjs" "cjs" "ts" "mts" "cts" ];
      };
      
      rust = {
        symbol = "🦀 ";
        format = "via [$symbol($version )]($style)";
        style = "bold red";
      };
      
      java = {
        symbol = "☕ ";
        format = "via [$symbol($version )]($style)";
        style = "bold red";
      };
      
      time = {
        disabled = false;
        format = "\\[ $time \\]($style) ";
        time_format = "%T";
        style = "bold dimmed white";
      };
      
      cmd_duration = {
        min_time = 2000;
        format = "took [$duration]($style) ";
        style = "yellow";
      };
      
      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = "🧠 ";
        style = "bold dimmed green";
        format = "via $symbol[$ram_pct]($style) ";
      };
      
      battery = {
        full_symbol = "🔋";
        charging_symbol = "⚡️";
        discharging_symbol = "💀";
        disabled = false;
        display = [
          {
            threshold = 10;
            style = "bold red";
          }
          {
            threshold = 30;
            style = "bold yellow";
          }
        ];
      };
      
      jobs = {
        symbol = "⚙️";
        style = "bold blue";
        number_threshold = 1;
        format = "[$symbol]($style)";
      };
      
      status = {
        disabled = false;
        format = "[$symbol$status]($style) ";
        style = "bold red";
        symbol = "💀 ";
      };
      
      line_break = {
        disabled = false;
      };
    };
  };
}
