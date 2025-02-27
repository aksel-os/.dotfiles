{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
    settings = {
      format = ''
      $hostname$username$directory$git_branch$git_state$git_status$fill$cmd_duration$fill$line_break$character
      '';

      directory = {
        truncate_to_repo = true;
        truncation_length = 1;
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)]\) ";
        style = "cyan";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](bright-black) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      cmd_duration = {
        format = "[$duration]($style)";
        style = "yellow";
      };

      fill = {
        symbol = " ";
      };

      character = {
        success_symbol = "[❯](bold-cyan)";
        error_symbol = "[❯](bold-red)";
      };
    };
  };
}
