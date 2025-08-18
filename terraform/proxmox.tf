variable "nodes" {
  default = {
    master = 1
    worker = 2
  }
}

# Master
resource "proxmox_vm_qemu" "k8s_master" {
  count       = var.nodes.master
  boot        = "order=virtio0;ide2;net0"
  name        = "k8s-master-${count.index}"
  target_node = "proxmox"
  agent       = 1
  cpu { cores = 2 }
  memory = 2048
  scsihw = "virtio-scsi-single"

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-metal-amd64.iso"
        }
      }
    }

    virtio {
      virtio0 {
        disk {
          size    = "100G"
          storage = "local-lvm"
        }
      }
    }
  }


  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}

# Workers
resource "proxmox_vm_qemu" "k8s_worker" {
  count       = var.nodes.worker
  boot        = "order=virtio0;ide2;net0"
  name        = "k8s-worker-${count.index}"
  target_node = "proxmox"
  agent       = 1
  cpu { cores = 2 }
  memory = 2048
  scsihw = "virtio-scsi-single"

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-metal-amd64.iso"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          size    = "200G"
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}

