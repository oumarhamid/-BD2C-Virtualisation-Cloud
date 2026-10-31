# BD2C — Virtualisation et Cloud Computing

**Faculté des Sciences Aïn Chock (FSAC)** · Master Big Data et Cloud Computing (BD2C) · **2026–2027**

Dépôt pédagogique regroupant les travaux pratiques du module **Virtualisation et Cloud Computing**.

## Travaux pratiques

| TP | Sujet | Avancement |
|---|---|---|
| [TP1](TP1-KVM-QEMU-Libvirt/README.md) | Virtualisation avec KVM/QEMU et libvirt : VM, clones, images d'OS, templates | Partie A validée ; partie B en cours |
| [TP2](TP2-Cloud-Init/README.md) | Personnalisation et automatisation avec Cloud-Init : NoCloud, SSH, YAML, Jinja2 et multi-VM | À commencer après le template TP1 |

## Environnement de laboratoire

- Hôte physique : Windows 10, VMware Workstation.
- Hôte Linux du TP : Ubuntu 24.04 LTS dans VMware, avec virtualisation imbriquée.
- Hyperviseur des travaux pratiques : KVM/QEMU et libvirt (`qemu:///system`).
- Réseau virtuel : NAT libvirt `default`.
- Les VM sont exécutées successivement sur un PC avec 8 Go de RAM.

## Structure

```text
TP1-KVM-QEMU-Libvirt/
  README.md
  commandes/
  captures/
  preuves/
TP2-Cloud-Init/
  README.md
  nocloud/
  profiles/
  templates/
  inventory/
  generated/
  captures/
```

## Bonnes pratiques

- Conserver les commandes, configurations texte, explications et captures utiles.
- **Ne pas publier** d'images ISO, de disques virtuels RAW/QCOW2/VMDK, de clés privées, de mots de passe ni de données personnelles.
- Vérifier les captures et les fichiers de configuration avant chaque `git push`.
- Conserver les images volumineuses localement et ne les fournir à l'enseignant que sur demande.

Ce dépôt sera complété progressivement avec les résultats réellement obtenus pendant les TP.
