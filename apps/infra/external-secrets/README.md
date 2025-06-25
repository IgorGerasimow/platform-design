# External Secrets Operator

This chart installs the [External Secrets Operator](https://github.com/external-secrets/external-secrets)
using the official Helm chart from the project's `deploy` directory.

The `Chart.yaml` declares a dependency on the upstream chart so ArgoCD can
pull it automatically. The provided `values.yaml` enables CRD installation.

This application will be discovered by the ApplicationSet and deployed into
each cluster as an infrastructure component.
