Deploy Prometheus & Grafana Helm charts:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

kubectl create namespace monitoring

helm install prom prometheus-community/prometheus   --namespace monitoring -f monitoring/prometheus-values.yaml

helm install graf grafana/grafana   --namespace monitoring -f monitoring/grafana-values.yaml
```
