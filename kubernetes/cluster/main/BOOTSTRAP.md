# Cluster Secrets
- Connection to external secret store (Bitwarden) requires manual bootstrapping of secret into an existing namespace (handled by `namespaces/external-secrets.yaml`). 

You will need to bootstrap this manually once the namespace exists:
```
export TOKEN=hunter2 # put your Bitwarden token here

kubectl create secret generic bitwarden-access-token \
  -n external-secrets \
  --from-literal=token=$TOKEN
  ```
