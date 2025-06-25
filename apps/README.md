# Application Helm Charts

This directory stores Helm charts used by ArgoCD's ApplicationSet to deploy services.

## Structure

- `infra/` – infrastructure tools deployed to clusters
- `infra/external-secrets/` – installs the External Secrets Operator
- `direct/` – applications for the Direct team stack
- `mono/` – applications for the Mono team stack
- `protocols/` – protocol-related services
- `chains/` – blockchain nodes and components
- `listeners/` – event listeners and workers

Each subdirectory may contain one or more Helm charts. The ApplicationSet in `argocd/applicationset.yaml` watches these paths and creates an Application for every chart.
