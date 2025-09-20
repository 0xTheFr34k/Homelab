{ pkgs, lib, config, inputs, ... }:

{
  dotenv.enable = true;

  packages = with pkgs; [
    sops
    age
    fluxcd
    talosctl
    ansible
    stern
    terraform
    kubernetes-helm
    kubectx
  ];
}
