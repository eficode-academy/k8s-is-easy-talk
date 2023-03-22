---
theme: default
author: Kom i gang med k8s | @zanderhavgaard
date: March 2, 2023
paging: Slide %d / %d
---

# Kom i gang med Kubernetes

## Jeg viser dig hvordan ...

```


 ________________
< k8s is awesome >
 ----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||


(k8s=Kubernetes)

```

Slides og kode er tilgængelig i git repositoriet:

https://github.com/eficode-academy/k8s-is-easy-talk

---

# $ whoami

## Zander Havgaard

- DevOps Konsulent @ Eficode København
  - Jeg arbejder med: DevOps, Cloud Native, Containers, Orchestration, IaC, CI/CD, Cloud, og mere.
- Underviser: Kubernetes, Docker, Cloud Native Tools and more.
- Speaker

Email: zander.havgaard(at)eficode.com

---

## GitHub: @zanderhavgaard

# Agenda

- Hvad er Kubernetes og hvad kan det gøre for dig?
- Hvorfor er det Kubernetes er så sejt?
- Demoer!
  - Kubernetes Workloads `deployments`
  - Kubernetes Netværk & Service Discovery - `services`
  - `GitOps` med `ArgoCD`
  - Horizontal Cluster Auto Skalering med `Karpenter`
- Hvordan kommer jeg i gang med at lære om Kubernetes?

## Format: En håndfuld slides og så demoer!

> Stil gerne spørgsmål undervejs eller til sidst!

> Under demoerne er der meget tekst, det er ikke meningen at I skal læse det hele.

---

# Hvem er denne her talk for?

- Alle der er nysgerrige omkring Kubernetes
- Alle der ikke har prøvet Kubernetes endnu
- Dem der gerne vil prøve Kubernetes, men har hørt at det er for svært
- Dem der har prøvet Kubernetes, men fundet at det er for svært
