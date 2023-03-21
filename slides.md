---
theme: default
author: k8s is easy | @zanderhavgaard
date: March 2, 2023
paging: Slide %d / %d
---

# Kubernetes is easy!

## Let me show you how ...

```


 ________________
< k8s is awesome >
 ----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

---

# $ whoami

## Zander Havgaard

- DevOps Consultant @ Eficode Copenhagen
  - I work with: DevOps, Cloud Native, Containers, Orchestration, IaC, CI/CD, Cloud, and more.
- Trainer: Kubernetes, Docker, Cloud Native Tools and more.
- Speaker

Email: zander.havgaard(at)eficode.com

GitHub: @zanderhavgaard

---

# Agenda

- What is Kubernetes and why should you care?
- Why you should be excited about Kubernetes
- Demos!
  - Scheduling Kubernetes Workloads - `deployments`
  - Kubernetes Networking & Service Discovery - `services`
  - `GitOps` with `ArgoCD`
  - Horizontal Cluster Auto Scaling with `Karpenter`
- How do I get started learning about Kubernetes?

## Format: Just a few slides, then demos!

> Feel free to ask questions during the talk or afterwards!

> During the demos there will be a lot of text, you don't need to read it.

<!--
10 mins for intro slides
4 * 5 mins for demos
total 30 mins
-->

---

# Who is this talk for?

- Anyone who is curious about Kubernetes.
- Anyone who has not used Kubernetes yet.
- Anyone who wants to use Kubernetes, but has heard that it is too hard.
- Anyone who has tried Kubernetes, but found it too hard.

## While I can't teach you anything meaningful in the short time we have, hopefully I can inspire you to try it yourself.

---

# Kubernetes is not easy ... But it doesn't have to be hard!

(The title is of course click bait)

Kubernetes is made up of a lot components.

Most of the components are simple.

The **number** of components makes Kubernetes complex, but it also makes it **powerful**!

You don't need to know _everything_ about Kubernetes to use it!

## I wish that someone else had told me this when I was starting out learning about Kubernetes and Cloud Native.

---

# The best thing about Kubernetes: It allows us to do things in opinionated ways!

> "Standing on the shoulders of giants"

The Kubernetes workflow is based on the operational experience of companies like Google, Microsoft, Netflix, Amazon, Red Hat, etc.

We indirectly benefit from their collective experience by using the same tooling!

Which means we don't have to reinvent the wheel to follow best practices.

Kubernetes is also the foundation for many other Cloud Native technologies.

---

# Cool, so how does it work?

We install Kubernetes on a number of machines we want to run our `containers`.

This is now our `cluster` made up of `nodes`.

(node = machine/server/VM etc.)

(cluster = group of nodes)

Kubernetes then automates the _running_ of our containers in the cluster.

---

# Desired State

We tell Kubernetes what our `desired state` is, and the Kubernetes control-plane will make changes to the cluster to fulfil this desired state.

This process is continuous - this means that once we have defined our desired state, Kubernetes will keep fulfilling it if things change.

## Most importantly this means we tell Kubernetes _what we want_ and not _how to do it_.

We interact with Kubernetes through it's API - typically using the CLI `kubectl`

(I have aliased k=kubectl in my demos)

<!-- DEMO
we have nodes:
run $ kubectl get nodes
-->

---

# K8s has pods ...

```
process -> container -> pod
```

Pods contain usually one container, but can contain more than one!

Pods are _scheduled_ to `worker nodes`.
Usually Kubernetes chooses which node.

Configuration is associated with pods, not with containers.

Pods can be replicated as exact copies using the `deployment` controller.

---

# Example application: quotes-flask

Small "micro service" application

`frontend` -> `backend` -> `database`

So we need 3 pods!

(Can be found at https://github.com/eficode-academy/quotes-flask)

---

# Demo: Scheduling Kubernetes Workloads

We can define our desired state in manifest files -> which enables `deployments as code`!

We typically schedule pods using `deployments`.

`deployments` are an abstraction to help us mange the scheduling, configuration and lifecycle of applications.

Let's deploy the `quotes-flask` frontend using a `deployment` manifest and then replicate it!

<!-- DEMO
Show pre-created frontend manifest
- talk about how we express everything in k8s as code
- manifest express our desired state
- we send these to k8s control plane and it makes changes to the cluster
- show that we can port-forward to the pod and that it is actually running
- kubectl port-forward frontend-* 8080:5000
-->

---

# Demo: Kubernetes Networking & Service Discovery

We want to have redundancy and high availability for our applications.

So that _when_ they break, we have redundant copies that can serve requests while the system recovers.

This means we have to figure out where our applications are running int the cluster, we call this `service discovery`.

This means we need to `load balance` between our `replicas`.

Enter `services` which help us with service discovery, load balancing and more.

Let's add a `service` to our frontend!

<!-- DEMO
- we want high-availability
- scale the frontend to 3 replicas
- now we need to load balance
- show the frontend service manifest
- apply it
- deploy the network multitool to have a shell in the cluster network
- exec into the multitool pod show that we can resolve the frontend DNS name
- use /ip endpoint to show that we are actually load-balancing between the three instances
-->

---

# Demo: GitOps

Kubernetes allows us to do declarative deployments using desired state specifications (manifests).

We can put all of these in a `git` repository and point a `gitops` controller at it.

We will use `ArgoCD` as our gitops controller.

Now we have a central "source of truth" of the desired state.
ArgoCD now handles the actual scheduling for us!

Let's deploy `ArgoCD` and deploy the rest of the `quotes-flask` application using GitOps!

---

# Demo: Horizontal Cluster Auto Scaling

Kubernetes expects us to specify how many resources (CPU/Memory) to allocate for each instance (Pod)

What happens when we run out of resources?

Or when we have too many resources we are not consuming?

We can scale the cluster itself up and down - by adding or removing nodes.

Let's deploy `karpenter` and scale the cluster!

---

# Kubernetes makes (Cloud Native) scheduling easy:

Kubernetes allows us to define the desired state of our applications and infrastructure.

Based on our desired state Kubernetes helps us automate the scheduling, configuration and lifecycle of our containers, networking, infrastructure and more!

Imagine doing everything I just showed you manually!

We can even use Kubernetes to schedule and control resources external to the cluster using things like `Crossplane`!

---

# How do I get started with Kubernetes?

- Read the official docs on https://k8s.io
- Take a course - there are many and many of them are good!
  - Eficode has a number of Kubernetes and Cloud Native courses.
- Run k8s on your own machine - use KinD (kubernetes-in-docker)
- Try the free tiers on public cloud and create a cluster to play around with
- Have some Raspberry Pis? Run https://k3s.io on them!
- Get certified from the linux Foundation:
  - CKAD - Certified Kubernetes Application Developer (for devs)
  - CKA - Certified Kubernetes Administrator (for cluster admins)

---

# Thank you!

Feel free to reach out: zander.havgaard(at)eficode.com

These slides and all files used are on GitHub:

https://github.com/eficode-academy/k8s-is-easy-talk

```
 ____________
< Questions? >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

<!-- Note to self: don't over explain -->
