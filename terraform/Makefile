init:
	terraform init -plugin-dir="${HOME}/.terraform.d/plugins" -upgrade
plan:
	terraform plan
gen:
	talosctl gen config talos-proxmox-cluster https://${CONTROL_PLANE_IP}:6443 --output-dir _out --install-image factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.10.6 --force

applay-gen:
	talosctl apply-config --insecure --nodes ${CONTROL_PLANE_IP} --file _out/controlplane.yaml
	talosctl apply-config --insecure --nodes ${WORKER_IP1} --file _out/worker.yaml
	talosctl apply-config --insecure --nodes ${WORKER_IP2} --file _out/worker.yaml

config:
	talosctl config endpoint ${CONTROL_PLANE_IP}
	talosctl config node ${CONTROL_PLANE_IP} --talosconfig _out/talosconfig
	talosctl config node ${WORKER_IP1} --talosconfig _out/talosconfig
	talosctl config node ${WORKER_IP2} --talosconfig _out/talosconfig
bootstrap:
	talosctl bootstrap --talosconfig _out/talosconfig
	talosctl kubeconfig . --talosconfig _out/talosconfig
