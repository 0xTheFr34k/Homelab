<p align="center">
  <img src="docs/assets/homelab.png" alt="Homelab Architecture" width="800"/>
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

- **proxmox (bare-metal)** → Base hypervisor running all VMs and containers
- **terraform/** → Infrastructure provisioning (VMs, networking, storage on Proxmox)
- **ansible/** → Node configuration and automation
- **talos/** → Kubernetes cluster OS + secrets
- **kubernetes/** → GitOps-managed workloads (Flux, apps, infra)
- **devenv.nix** → Developer environment setup
- **Taskfile.yml** → Reproducible commands with [Task](https://taskfile.dev/)

---
💡 Built for learning, automation, GitOps, and experimentation.

