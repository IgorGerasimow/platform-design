# Generic Application Chart

This Helm chart deploys a generic application container with optional Nginx ingress and integration with the External Secrets Operator using AWS as the backend.

## Features

- Deployment and Service resources.
- Optional Ingress resource supporting multiple ingress classes (e.g., `nginx`, `internal-nginx`).
- Optional ExternalSecret resource to fetch secrets from AWS Secrets Manager via External Secrets Operator.

## Values

Key settings in `values.yaml`:

- `image.repository` – container image to deploy.
- `ingress.enabled` – enable ingress.
- `ingress.className` – default ingress class.
- `ingress.extraClasses` – additional ingress classes to create separate ingress objects.
- `externalSecrets.enabled` – enable integration with External Secrets Operator.
- `externalSecrets.secretStoreRef` – reference to a `SecretStore` or `ClusterSecretStore` configured for AWS.

Consult the `values.yaml` file for the full list of configuration options.
