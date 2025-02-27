{}:

{
  home.packages = [ pkgs.starship ];

  packages.starship = {
    enable = true;
    settings = {
      add_newline = false;
      palette = "default";

      format = """
      [╭](fg:separator)\
      $status\  
      $directory  \
      $cmd_duration\
      $line_break\
      [╰](fg:separator)\
      $character\
      """;

      # Palettes Default
      palettes.default = {
        prompt_ok  = "#8047c1";
        prompt_err = "#e23140";
        icon       = "#161514";
        separator  = "#35312c";
        background = "#35312c";

        directory  = "#9f31e2";
        duration   = "#e26f31";
        status     = "#e23140";
      };

      # Character
      character = {
        success_symbol = "[❯](fg:prompt_ok)";
        error_symbol = "[❯](fg:prompt_err)";
      };

      # Directory
      directory = {
        format = "[─](fg:separator)[](fg:directory)[](fg:icon bg:directory)[](fg:directory bg:background)[ $path](bg:background)[](fg:background)";
        truncate_to_repo = false;
        truncation_length = 0;
      };

      # Status
      status = {
        disabled = false;
        format = "[─](fg:separator)[](fg:status)[](fg:icon bg:status)[](fg:status bg:background)[ $status](bg:background)[](fg:background)";
        pipestatus = true;
        pipestatus_separator = "-";
        pipestatus_segment_format = "$status";
        pipestatus_format = "[─](fg:separator)[](fg:status)[](fg:icon bg:status)[](fg:status bg:background)[ $pipestatus](bg:background)[](fg:background)";
      };

      # CMD Duration
      cmd_duration = {
        format = "[─](fg:separator)[](fg:duration)[󱐋](fg:icon bg:duration)[](fg:duration bg:background)[ $duration](bg:background)[](fg:background)";
        min_time = 1000;
      };

      # Time
      time = {
        disabled = false;
        format = "[](fg:duration)[󰥔](fg:icon bg:duration)[](fg:duration bg:background)[ $time](bg:background)[](fg:background)";
      };
      
      custom = {
        direnv = {
          format = "[\\[direnv\\]]$(style) ";
          when = "env | grep -E '^DIRENV_FILE='";
        };
      };
    };
  };
}
