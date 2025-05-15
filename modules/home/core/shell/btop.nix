{ pkgs, ... }:

{
  home.packages = [ pkgs.btop ];

  programs.btop = {
    enable = true;
    settings = {
      # General
      color_theme = "Default";
      theme_background = true;
      truecolor = true;
      force_tty = false;
      vim_keys = true;

      update_ms = 100; 

      graph_symbol = "braille"; # choose between braille, block or tty
      shown_boxes = "cpu mem net proc";

      background_update = true;
      
      clock_format = "%X";

      # Processes
      proc_sorting = "cpu lazy"; # Processes sorting, "pid" "program" "arguments" "threads" "user" "memory" "cpu lazy" "cpu direct"
      proc_reversed = false;
      proc_tree = true;
      proc_colors = true;
      proc_gradient = true;

      proc_per_core = false;
      proc_mem_bytes = false;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      
      proc_left = true;
      proc_filter_kernel = true;

      proc_aggregate = false;
      
      
      # CPU
      cpu_graph_upper = "total";
      cpu_graph_lower = "iowait";

      show_gpu_info = "Auto";

      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      temp_scale = "celsius";
      
      base_10_sizes = false;
      show_cpu_freq = true;

      # Memory
      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;

      # Drives
      show_disks = true;
      only_physical = true;
      use_fstab = false;
      disk_free_priv = true;
      show_io_stat = true;
      io_mode = true;
      io_graph_combined = true;

      # Networking
      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;

      # Battery
      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;
    };
  };
}
