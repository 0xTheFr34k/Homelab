<p align="center">
  <img src="docs/assets/homelab.png" alt="Homelab Architecture" width="30%"/>
</p>

This repository contains my homelab setup using **Infrastructure as Code (IaC)** and modern automation tools, running on **bare-metal Proxmox**.  

## 🚀 Stack

<p align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" alt="Terraform" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ansible/ansible-original.svg" alt="Ansible" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" alt="Kubernetes" width="60" height="60"/>
  <img src="https://fluxcd.io/img/flux-icon@2x.png" alt="FluxCD" width="60" height="60"/>
  <img src="https://www.talos.dev/images/logo.svg" alt="Talos" width="60" height="60"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nixos/nixos-original.svg" alt="Nix" width="60" height="60"/>
  <img src="https://blog.zwindler.fr/2017/08/proxmox_logo.png" alt="Proxmox" width="60" height="60"/>
  <img src="https://taskfile.dev/img/logo.png" alt="Task" width="60" height="60"/>
</p>

## 📂 Structure

- **[Proxmox](https://www.proxmox.com/)** → Base hypervisor running all VMs and containers
- **[terraform/](https://www.terraform.io/)** → Infrastructure provisioning (VMs, networking, storage on Proxmox)
- **[ansible/](https://www.ansible.com/)** → Node configuration and automation
- **[talos/](https://www.talos.dev/)** → Kubernetes cluster OS + secrets
- **[kubernetes/](https://kubernetes.io/)** → GitOps-managed workloads (Flux, apps, infra)
- **[devenv.nix](https://devenv.sh/)** → Developer environment setup
- **[Taskfile.yml](https://taskfile.dev/)** → Reproducible commands with Task

---
💡 Built for learning, automation, GitOps, and experimentation.

