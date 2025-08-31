variable "masters" {
  default = {
    master0 = {
      name        = "k8s-master-0"
      vmid        = 100
      target_node = "proxmox"
      cpu         = 6
      memory      = 6000
      disk        = "200G"
      storage     = "local-lvm"
      macaddr     = "BC:24:11:25:C3:77"
    }
  }
}

variable "workers" {
  default = {
    worker0 = {
      name        = "k8s-worker-0"
      vmid        = 200
      target_node = "proxmox"
      cpu         = 10
      memory      = 10000
      disk        = "700G"
      storage     = "local-lvm"
      macaddr     = "BC:24:11:FF:D9:DE"
    }
  }
}

resource "proxmox_vm_qemu" "k8s_master" {
  for_each = var.masters

  name        = each.value.name
  vmid        = each.value.vmid
  target_node = each.value.target_node
  boot        = "order=virtio0;ide2;net0"
  agent       = 1
  scsihw      = "virtio-scsi-single"

  cpu { cores = each.value.cpu }
  memory = each.value.memory

  disks {
    ide {
      ide2 {
        cdrom { iso = "local:iso/talos-metal-amd64.iso" }
      }
    }
    virtio {
      virtio0 {
        disk {
          size    = each.value.disk
          storage = each.value.storage
          cache   = "writethrough"
        }
      }
    }
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
    macaddr  = each.value.macaddr
  }
}

resource "proxmox_vm_qemu" "k8s_worker" {
  for_each = var.workers

  name        = each.value.name
  vmid        = each.value.vmid
  target_node = each.value.target_node
  boot        = "order=virtio0;ide2;net0"
  agent       = 1
  scsihw      = "virtio-scsi-single"

  cpu { cores = each.value.cpu }
  memory = each.value.memory

  disks {
    ide {
      ide2 {
        cdrom { iso = "local:iso/talos-metal-amd64.iso" }
      }
    }
    virtio {
      virtio0 {
        disk {
          size    = each.value.disk
          storage = each.value.storage
        }
      }
    }
  }

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = false
    macaddr  = each.value.macaddr
  }
}
