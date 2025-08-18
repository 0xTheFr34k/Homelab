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
}
