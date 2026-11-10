# Personal website on K3s

Public URL: https://me.aiinmotion.dev

Argo CD watches `site/` on `main`. Kustomize packages `site/index.html`
into a ConfigMap and updates its generated name when the content changes,
triggering a Deployment rollout. No custom image or image-build workflow is
needed for this static site. The GitHub profile README and its workflows remain
independent.

## Deploy

Merge the website files into `main` before applying the Application. These
commands assume Argo CD is installed in the `argocd` namespace and its
`default` project allows this repository and destination.

```sh
kubectl apply -f argocd/personal-site.yaml
kubectl -n argocd get application personal-site
kubectl -n personal-site rollout status deployment/personal-site --timeout=120s
kubectl -n personal-site get pods -o wide
```

Wait for Argo CD to report `Synced` and `Healthy`. If the Deployment has not
been created yet, wait for the initial sync before running rollout status.

## Test before publishing

```sh
kubectl -n personal-site port-forward service/personal-site 8080:80
```

Open http://localhost:8080 on the management Mac. Stop port-forwarding with
Ctrl+C when finished.

## Cloudflare Tunnel route

On the existing `homelab-k3s` tunnel, add a published application/public hostname:

| Setting | Value |
| --- | --- |
| Subdomain | `me` |
| Domain | `aiinmotion.dev` |
| Path | Leave empty |
| Service type | `HTTP` |
| Service URL | `personal-site.personal-site.svc.cluster.local:80` |

The complete origin URL is `http://personal-site.personal-site.svc.cluster.local:80`.
Cluster DNS resolves this address from the cloudflared pods. Visitors use
HTTPS at Cloudflare. No NodePort, public node IP, or UniFi port forwarding is
required. If a DNS record for `me` already exists, review it before replacing it.

The cloudflared Deployment and existing `cloudflare/tunnel-token` Secret remain
separately managed. This Application owns only the website resources. Never
commit tunnel tokens to Git.

## Updating the website

Edit `site/index.html` and push/merge to `main`. Argo CD detects the commit
and syncs it automatically (or choose Refresh and Sync in its dashboard).
For rollback, revert the website commit in Git.

The page currently uses `hello@aiinmotion.dev` contact links. Confirm this
mailbox exists or replace those links before sharing the site broadly.
