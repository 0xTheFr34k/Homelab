CONTROL_PLANE_IP=192.168.1.41
WORKER_IP1=192.168.1.42
WORKER_IP2=192.168.1.40
KUBECONFIG_FILE=kubeconfig
MERGED_KUBECONFIG=/tmp/merged-kubeconfig

init:
	terraform init -plugin-dir="${HOME}/.terraform.d/plugins" -upgrade
plan:
	terraform plan
gen:
	talosctl gen config  --install-disk "/dev/vda/" talos-proxmox-cluster https://${CONTROL_PLANE_IP}:6443 --output-dir _out --install-image factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.10.6 --force

applay-gen:
	talosctl apply-config --insecure --nodes ${CONTROL_PLANE_IP} --file _out/controlplane.yaml
	talosctl apply-config --insecure --nodes ${WORKER_IP1} --file _out/worker.yaml
	talosctl apply-config --insecure --nodes ${WORKER_IP2} --file _out/worker.yaml

bootstrap:
	talosctl config endpoint ${CONTROL_PLANE_IP}
	talosctl config endpoint ${CONTROL_PLANE_IP}
	talosctl bootstrap
	talosctl kubeconfig .

merge-kubeconfig:
	KUBECONFIG=$(HOME)/.kube/config:$(KUBECONFIG_FILE) kubectl config view --merge --flatten > $(MERGED_KUBECONFIG)
	mv $(MERGED_KUBECONFIG) $(HOME)/.kube/config

