{ pkgs, lib, config, inputs, ... }:

{
  dotenv.enable = true;

  packages = with pkgs; [
    sops
    age
    fluxcd
    talosctl
    talhelper
    ansible
    stern
    terraform
    kubernetes-helm
    kubectx
    kubectl
    istioctl
  ];
}
