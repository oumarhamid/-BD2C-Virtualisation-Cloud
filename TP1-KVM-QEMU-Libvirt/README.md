# TP1 — Virtualisation avec KVM/QEMU et libvirt

**Objectif :** créer, cloner et administrer des VM ; conserver une image d'OS ; construire un template généralisé ; déployer deux instances indépendantes.

## Progression

- [x] **Partie A — Exercice 1 :** vérifier la virtualisation imbriquée et `/dev/kvm`.
- [x] **Partie A — Exercice 2 :** installer KVM/QEMU, libvirt et les outils associés ; vérifier `qemu:///system` et le réseau `default`.
- [ ] **Partie B — Exercice 3 :** télécharger et vérifier l'ISO Ubuntu Server 24.04 ; préparer le réseau NAT.
- [ ] **Partie B — Exercices 4–5 :** installer et administrer la VM source `ubuntu-vm01`.
- [ ] **Partie C — Exercice 6 :** réaliser un clone complet et comparer les identités.
- [ ] **Partie D — Exercices 7–8 :** capturer puis réimporter une image d'OS.
- [ ] **Partie E — Exercice 9 :** créer un template généralisé.
- [ ] **Partie F — Exercice 10 :** déployer `app01` et `app02` avec cloud-init.
- [ ] **Partie G — Exercice 11 :** comparer RAW et QCOW2.
- [ ] **Partie H — Exercice 12 :** répondre aux études de cas.

## Conventions du TP

```bash
export PREFIX=ubuntu
export OSVAR=ubuntu24.04
export ISO=/var/lib/libvirt/boot/ubuntu.iso
export VM=ubuntu-vm01
export CLONE=ubuntu-vm02
export RESTORE=ubuntu-restore01
export IMGDIR=/var/lib/libvirt/images
```

Les variables d'environnement doivent être redéfinies dans chaque nouveau terminal.

## Captures et preuves

- `captures/` : captures numérotées, sans informations privées.
- `preuves/` : fichiers texte de validation (XML libvirt, sommes SHA-256, etc.).
- `commandes/` : scripts et commandes reproductibles, ajoutés après validation.

**Ne pas placer les disques QCOW2, l'ISO ni les clés SSH privées dans ce dépôt.**
