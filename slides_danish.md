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

Jeg kan desværre ikke lære jer noget meningsfyldt på den korte tid vi har, men jeg kan inspirere jer til at prøve det selv.

---

# Kubernetes er ikke nemt ... Men det behøver ikke at være svært!

Kubernetes består af mange komponenter.

De fleste af komponenterne er simple.

Det er **antallet** af komponenter der gør Kubernetes komplekst, men det er også det der gør det **kraftfuldt**!

Du behøver ikke at vide _alt_ om Kubernetes for at bruge det!

## Jeg ville ønske at nogen havde sagt det til mig da jeg startede min med at lære om Kubernetes og Cloud Native.

---

Den bedste ting ved Kubernetes: Vi kan gøre ting på 'opinionated' måde!

> "Standing on the shoulders of giants"

Kubernetes workflowet er baseret på drifts erfaring fra firmaer som Google, Microsoft, Netflix, Amazon, Red Hat og flere!

We for indirekte glæde af de kollektive erfaringer der er blevet gjort, ved at bruge de samme værktøjer som dem!

Hvilket betyder at vi ikke skal genopfinde den dybe tallerken for at følge 'best practices'.

Kubernetes er også fundamentet for mange andre Cloud Native teknologier, så man køber ind i et helt økosystem ved at adoptere Kubernetes.

---

# Cool, så hvordan fungerer det?

Vi installerer Kubernetes på de maskiner vi gerne vil kører vores `containere` på.

Det er nu vores `cluster` udgjort af `noder`.

(node = maskine/server/vm etc.)

(cluster = gruppe af noder)

Kubernetes automatiserer _driften_ af vores containerer i vores cluster.

---

# Desired State

Vi fortæller Kubernetes hvad vores `desired state` er, og Kubernetes control-plane laver ændringer i clusteret for opfylde vores desired state.

Denne process er kontinuerlig - det betyder at efter vi har defineret vores desired state vil Kubernetes blive ved med at forsøge at opfylde den, indtil vi specificerer noget andet.

## Vigtigst af alt, betyder det at nå vi arbejder med Kubernetes så definerer vi _hvad vi vil have_ og ikke _hvordan det skal gøres_.

Vi interagerer med Kubernetes gennem dets API - typisk via CLI'et `kubectl`.

(I demoerne har jeg aliased k=kubectl)

---

# Kubernetes har `pods` ...

```
process -> container -> pod
```

Pods indeholder som regel en container, men kan indeholde flere.

Pods _kører_ på `worker nodes`.
Som udgangspunkt vælger Kubernetes vælger hvilken node pod'den skal kører på.

Konfiguration er associeret med pods, og ikke containerer.

Pods can blive replikeret som eksakte kopier vha. `deployment` controlleren.

---

# Eksempel applikation: quotes-flask

`frontend` -> `backend` -> `database`

Så vi har brug for at køre 3 pods!

(Kode kan findes her: https://github.com/eficode-academy/quotes-flask)

---

# Demo: Kubernetes Workloads - `deployments`

We can definerer desired State i `manifest` filer -> hvilket giver os `deployment as code`!

Vi bruger typisk `deployments` til at styre vores pods.

En `deployment` er en abstraktion der håndterer driften, konfigurationen og livscyklussen for en applikation.

Lad os kører quotes-flask applikationen med et `deployment`

# Demo: Kubernetes Netværk og Service Discovery

Vi vil gerne have redundans og "high availability" for vores applikationer.

Således at _når_ de gør i stykker, har vi redundant kopier der kan håndetere forespørgelser mens resten af systemet kommer op igen.

Det betyder at vi skal finde ud af hvor vores applikationer kører i clusteret, så vi kan lede netværks trafik til dem.

Det byder også at vi skal "load balance" i mellem vores replikaer.

Det kan vi løse i Kubernetes vha. `services`, hvilket giver os service discovery af vores pods, og balancerer trafikken mellem dem, og mere!

Lad os tilføje en `service` til vores frontend!

---

# Demo: GitOps med ArgoCD

Kubernetes lader os deklarere vores workloads vha. af desired state specikiationer (manifester).

We kan tage disse manifester og putte dem i et `git` repositorie, og så pege en `gitops` controller på dette.

Vi vil bruge `ArgoCD` som vires gitops controller.

Nu har vi lavet en central "source of truth" der definerer hvordan vores desired state skal se ud, og det er så gitops controlleren inde i clusteret der laver de egentlige ændringer for os.

Lad os tilføje `ArgoCD` til vores cluster og deploye resten af `quotes-flask` gennem gitops!

---

# Demo: Horisontal Cluster auto skalering med `Karpenter`

Kubernetes forventer at vi specificerer hvor mange ressourcer (CPU/RAM) den skal reserverer for hver instans vi laver.

Hvad sker der når løber tør for ressourcer i vores cluster?

Eller når vi har for mange ressourcer som vi ikke bruger?

Vi kan skalerer selve clusteret up og ned ved at tilføje og fjerne noder.

Lad os installerer `karpenter` og skalerer clusteret.

---

# Kubernetes gør (Cloud Native) Scheduling nemt

Vi kan definerer vores desired state både for vores applikationer og vores infrastruktur.

Baseret på vores desired state kan Kubernetes hjælpe os med at styre, driften, konfigurationen og livscyklussen for vores applikationer.

Forestil jer at gøre alt hvad jeg lige har gjort manuelt!

Vi kan endda også styre komponenter der ikke findes i Kubernetes, såsom cloud ressourcer gennem `Crossplane`.

---

# Hvordan kommer jeg i gang med Kubernetes?

- Officiel Dokumentation: https://k8s.indeholde
- Tag et kursus - f.eks. igennem IDA :-)
- Kør k8s på din egen maskine - KinD (Kubernetes in Docker)
- Gratis tiers på public cloud
- Hvis du har nogen Raspberry Pis - https://k3s.io
- Certificeringer fra Linux Foundation:
  - CKAD - Certified Kubernetes Application Developer (for devs)
  - CKA - Certified Kubernetes Administrator (for cluster admins)

---

# Thank you!

Send gerne en mail: zander.havgaard(at)eficode.com

Slides og kode kan findes på github:

https://github.com/eficode-academy/k8s-is-easy-talk

```
 ____________
< Sprøgsmål? >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
