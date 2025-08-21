talhelper gensecret > talsecret.sops.yaml
age-keygen

touch .sops.yaml
---
creation_rules:
  - age: >-
      <public-key>

sops -e -i talsecret.sops.yaml

touch talconfig.yaml

talhelper genconfig

talosctl apply-config -n 192.168.1.41  --file clusterconfig/talos-proxmox-cluster-worker-0.yaml --insecure


talosctl reset  -n 192.168.1.42 --talosconfig clusterconfig/talosconfig

thanks to this man https://khenry.substack.com/p/longhorn-on-talos
