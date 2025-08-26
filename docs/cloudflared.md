
# Cloudflared Tunnel Setup for Kubernetes

Follow these steps to set up a Cloudflare Tunnel in Kubernetes.

---

## 1. Login to Cloudflare

```bash
cloudflared tunnel login
```

This will open a browser to authenticate with your Cloudflare account.

---

## 2. Create the Tunnel

```bash
cloudflared tunnel create k8s-homelab-tunnel
```

This creates a tunnel and outputs a credentials JSON file in `~/.cloudflared/`.

---

## 3. Route DNS for the Tunnel

```bash
cloudflared tunnel route dns k8s-homelab-tunnel "*.ytaya.site"
```

This configures the tunnel to respond to your domain.

---

## 4. Copy Credentials

```bash
cp ~/.cloudflared/*.json ./credentials.json
```

This copies the credentials file to your working directory.

---

## 5. Generate Kubernetes Secret YAML (without applying)

```bash
kubectl create secret generic config-json-file-secret   --from-file=credentials.json   -n cloudflare   --dry-run=client   -o yaml > secret.yaml
```

This creates a Secret manifest (`secret.yaml`) you can commit to Git or encrypt with SOPS.

---

