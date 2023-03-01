# k8s-is-easy-talk

Repo for meetup talk "Kubernetes is easy: Let me show you how"

Contains all of the files used in the demos, just bring your own EKS cluster!
All of the demos except for `karpenter` are generic, and will work on any Kubernetes cluster.

## Slides

Slides can be found in the `slides.md` file, and can be rendered using: https://github.com/maaslalani/slides :

```sh
slides slides.md
```

## Taskfile

A `Taskfile` is included to make some of the more complicated commands easier to execute, install `task` from https://github.com/go-task/task

```sh
go-task <command>
```

## Bootstrap

For bootstrapping `ArgoCD` and `karpenter` use the scripts located in `scripts/` - you will need to change a few values.

### Karpenter

For getting karpenter to work, you will have to create an IAM role, and make appropriate changes to the eks config as well as add tags to the vpc, refer to the karpenter documentation: https://karpenter.sh/v0.24.0/
