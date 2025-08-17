terraform {
  required_providers {
    proxmox = {
      source  = "localhost/telmate/proxmox"
      version = "1.0.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://proxmox.local:8006/api2/json"
  pm_tls_insecure = true
  pm_log_enable   = true
  pm_log_file     = "terraform-plugin-proxmox.log"
  pm_debug        = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
