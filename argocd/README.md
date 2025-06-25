# ArgoCD ApplicationSet

This folder contains the ArgoCD configuration used to bootstrap application deployments across multiple clusters.

The `applicationset.yaml` definition relies on a matrix generator that combines:

- **Git directories** – application sources located under `apps/`. Directories named `*-kustomize` or the root `apps` directory itself are excluded.
- **Discovered clusters** – any cluster registered with ArgoCD. Environment and cluster labels are used to select value files.

For every combination of application path and cluster, an Application is created automatically. Helm value files are loaded from:

1. `apps/<app>/values.yaml`
2. `envs/<env>/values/<app>.yaml`
3. `envs/<env>/<cluster>/<app>.yaml`

The resulting Application deploys into the namespace `<env>-<app>` on the target cluster, and namespaces are created automatically.

## Usage

1. Ensure ArgoCD is running and has access to your clusters.
2. Apply the ApplicationSet:

```bash
kubectl apply -f argocd/applicationset.yaml -n argocd
```

After the file is applied, ArgoCD will detect application directories under `apps/` and deploy them to all registered clusters.
