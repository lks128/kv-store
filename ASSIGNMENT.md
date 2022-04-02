# DevOps task

## The task

We want to create a new key/value store service that runs in Kubernetes.
That service will expose a simple RESTful API on a given port.
At a minimum, this API should allow to GET and POST a value based on a key.
The details of the API are free for you to decide, but we need to be able to run
tests using the documentation/examples you provide.

For the actual storage of the key/value pairs, we want to use an existing 3rd
party data store. The choice of the data store is also up to you (MySQL,
PostgreSQL, Redis...) but for the scope of this exercise, we want it to run in
another container in the same cluster.
You can use a public image from Docker Hub.

We provide an example dataset that you should use to initialize the data store
during the first deployment. The dataset is in JSON. Feel free to convert it to
SQL for instance.

Your task is:
- To write a program that serves the REST API and read/write in the data store.
- To provide a Dockerfile that can build your service.
- To provide the necessary configuration to deploy this service and the data
  store in a Kubernetes environment (using either a manifest, helm chart, or
  Kustomize...)


## Requirements

- A bash script that builds the project, installs all requirements and starts 
  everything on a locak cluster would be appreciated.
- Any local cluster is fine: k3d, Minikube, Kind but assume we will test 
  your deployment on a fresh Debian environment.
- A working deliverable. It is fine if some features are missing but we should
  be able to deploy it without issues and to run the minimum GET/POST requests
  mentioned earlier.
- A document describing your solution. Nothing super fancy or very well written.
  Write it the same way you would make a note for your colleagues to explain to
  them what you did, why, and the gotchas or pitfalls.
- We estimate 3h should be enough to complete the task, test it, and write down
  some explanations. BUT, if you feel like going further by implementing some
  extra features like monitoring, logging, CICD, caching, etc. please do. We
  will of course take that into consideration for the time spent.

## Notes

The task is very open: You can choose any technology, programming language that
still fits the requirements.
In case the task description is not clear or if you are stuck somewhere please
contact us any time! We value collaboration and asking questions.

Despite the fact that this is just an exercise, we would like to see all the
common best practices like health checks or resource requests for instance.
The goal is for you to show us your experience.

As we don't expect you to spend too much time on this task, please add as many
comments as you want like "here we could improve this part by doing X", "if we
wanted to push that in production we should improve Y for security reasons" and
so on...

You can try your service in Kubernetes by running KinD or minikube locally in
case you don't have a Kubernetes cluster somewhere you can use. That's also how
we will test it.

## Dataset

```
[
    {
        "Homer": "Simpson",
        "Jeffrey": "Lebowski",
        "Stan": "Smith"
    }
]
```
