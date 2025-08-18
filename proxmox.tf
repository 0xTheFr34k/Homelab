variable "nodes" {
  default = {
    master = 1
    worker = 2
  }
}

# Master
resource "proxmox_vm_qemu" "k8s_master" {
  count       = var.nodes.master
  name        = "k8s-master-${count.index}"
  target_node = "proxmox"

  cpu {cores  = 2}
  memory = 2048

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-metal-amd64.iso"
        }
      }
    }
  }

  network {
    id = 0 
    model  = "virtio"
    bridge = "vmbr0"
  }
}

# Workers
resource "proxmox_vm_qemu" "k8s_worker" {
  count       = var.nodes.worker
  name        = "k8s-worker-${count.index}"
  target_node = "proxmox"

  cpu {cores  = 2}
  memory = 2048

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-metal-amd64.iso"
        }
      }
    }
  }

  network {
    id = 0 
    model  = "virtio"
    bridge = "vmbr0"
  }
}

