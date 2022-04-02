## Kubernetes Cluster
When I was deploying this cluster the goal was to have a managed Kubernetes cluster and container registry, but at the same time minimize costs. I also did not consider DigitalOcean and Linode, because as soon as we look at the better instances (more RAM and CPU), they get very close in pricing. 

![a](images/Pasted%20image%2020220402142926.png)

Azure Kubernetes Service is free when there is no SLA attached, so it is used to manage single worker cluster and takes care of the control plane.

For container registry I decided to use Amazon ECR because of its pricing model. 

## Solution architecture

![a](images/Pasted%20image%2020220402175935.png)

## Usage

Example how to put value. The service is currently deployed and can be used

```shell
% curl -X POST https://kv-store.defmacro.eu/test -d 'abcd' -H 'Content-Type: application/text'
{"status": "ok"}
```

Example how to get value

```shell
% curl  https://kv-store.defmacro.eu/test                                         
{"status": "ok", "data": {"key": "test", "value": "abcd"}}%
```

## Setup

Setup assumes a Kubernetes clusetr with existing Flux configured for it. For installation copy the flux-cluster/kv-store and flux-cluster/postrgesql directories to the flux repository and it will configure the deployments.

Wait for postgresql to become available and then use `setup-pg.sh` to initialize schema and create user.

### ECR pull token

Run `aws configure` and provide credentials from mail and then create `ecr-credentials` imagePullSecret.

```shell
kubectl create secret docker-registry ecr-credentials \
  --docker-server=722387802726.dkr.ecr.eu-central-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region eu-central-1)
```

### Traefik SSL

Traefik requires TLS certificates to be present in the cluster so that it can serve HTTPS traffic.

```
kubectl create secret generic traefik-tls --from-file fullchain.pem=fullchain.pem privkey.pem=privatekey.pem
```