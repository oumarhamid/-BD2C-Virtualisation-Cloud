# Virtualisation et Cloud Computing — Master BD2C

**Faculté des Sciences Aïn Chock (FSAC) — Université Hassan II de Casablanca**  
**Master : Big Data et Cloud Computing (BD2C)**  
**Année universitaire : 2026–2027**

Ce dépôt regroupe les travaux pratiques du module **Virtualisation et Cloud Computing**, avec les commandes exécutées, les preuves techniques et les captures d'écran permettant de reproduire et de vérifier les résultats.

> **État du projet — 3 novembre 2026 :** les manipulations du **TP1, exercices 1 à 8**, ont été réalisées et validées. Le compte rendu et certaines fiches descriptives restent à finaliser. Les exercices 9 à 12 sont à venir.

## Travaux pratiques

| TP | Sujet | État |
|---|---|---|
| [TP1](TP1-KVM-QEMU-Libvirt/) | Virtualisation avec KVM/QEMU et libvirt : VM, clones, images d'OS, templates | **En cours — exercices 1 à 8 réalisés** |
| [TP2](TP2-Cloud-Init/) | Personnalisation et automatisation avec Cloud-Init | **À réaliser** |

## TP1 — Objectifs

- Préparer un environnement **KVM/QEMU et libvirt**.
- Installer et administrer une machine virtuelle Ubuntu Server.
- Créer un **clone complet** et distinguer les identités matérielles et système.
- Capturer une **image d'OS installé**, en contrôler l'intégrité et la réimporter.
- Préparer ensuite un **template généralisé**, déployer deux instances distinctes et comparer les formats RAW et QCOW2.
- Argumenter le choix entre **clone, image d'OS et template** selon les besoins.

### Environnement du laboratoire

| Composant | Configuration utilisée |
|---|---|
| Poste physique | Windows 10, processeur Intel Core i5-6300U, 8 Go de RAM |
| Hyperviseur parent | VMware Workstation, avec virtualisation imbriquée |
| Hôte KVM | Ubuntu Desktop 24.04 LTS dans VMware |
| Hyperviseur et administration | KVM, QEMU, libvirt (`qemu:///system`), `virsh`, `virt-install`, `virt-manager` |
| Système invité | Ubuntu Server 24.04.5 LTS, architecture x86_64 |
| Configuration de la VM source | 2 vCPU, 2 048 Mio de RAM, disque QCOW2 de 15 Gio |
| Périphériques | Disque et réseau VirtIO ; réseau NAT libvirt `default` avec DHCP |
| Logiciels dans l'invité | OpenSSH Server, Cloud-Init, QEMU Guest Agent |

Les VM sont exécutées **successivement** en raison des ressources matérielles disponibles.

### Progression détaillée

| Partie | Exercice | Travail réalisé | État |
|---|---|---|---|
| A | 1 | Diagnostic de la virtualisation et des ressources KVM | Terminé |
| A | 2 | Installation et contrôle des outils KVM/libvirt | Terminé |
| B | 3 | Vérification de l'ISO Ubuntu Server et du réseau NAT `default` | Terminé |
| B | 4 | Installation de la VM source `ubuntu-vm01` | Terminé |
| B | 5 | Administration, SSH, agent invité et fichier témoin | Terminé |
| C | 6 | Clone complet `ubuntu-vm02`, comparaison des identités, indépendance des disques | Terminé |
| D | 7 | Capture et contrôle de `ubuntu-os-capture-v1.qcow2`, SHA-256 et export XML | Manipulations terminées ; fiche d'image à finaliser |
| D | 8 | Réimportation de l'image dans `ubuntu-restore01` et test de démarrage | Terminé |
| E | 9 | Préparation d'un template généralisé | À faire |
| F | 10 | Déploiement des instances `app01` et `app02` par Cloud-Init | À faire |
| G | 11 | Étude des formats RAW/QCOW2 | À faire |
| H | 12 | Études de cas professionnels | À faire |

Pour le suivi synthétique, voir **[AVANCEMENT.md](TP1-KVM-QEMU-Libvirt/AVANCEMENT.md)**.

### Machines virtuelles et images créées

| Nom | Rôle | Résultat |
|---|---|---|
| `ubuntu-vm01` | VM source Ubuntu Server, nom d'hôte `srv-source` | Installation et administration validées |
| `ubuntu-vm02` | Clone complet de la source | Disque indépendant ; identités internes dupliquées identifiées |
| `ubuntu-os-capture-v1.qcow2` | Image archivée du système installé | QCOW2, 15 Gio virtuels, contrôle structurel réussi |
| `ubuntu-restore01` | VM créée à partir d'une copie de l'image d'OS | Démarrage sans réinstallation et fichier témoin retrouvés |

Le fichier `/opt/tp1/version.txt` contient **`Version applicative TP1 : v1`**. Sa présence dans la VM restaurée prouve que le système installé et sa personnalisation ont été récupérés.

L'image capturée a une capacité virtuelle de **15 Gio** et une occupation observée d'environ **4,13 Gio** au moment du contrôle. Son empreinte SHA-256 est conservée dans [`capture.sha256`](TP1-KVM-QEMU-Libvirt/preuves/capture.sha256). L'export de la définition libvirt est conservé dans [`capture-config.xml`](TP1-KVM-QEMU-Libvirt/preuves/capture-config.xml).

> Cette capture est **non généralisée** : elle conserve notamment l'identité système et le nom d'hôte de la source. Elle ne remplace pas un template préparé pour le déploiement de plusieurs serveurs.

### Preuves et captures

Les éléments du TP1 sont classés dans :

- [`captures/`](TP1-KVM-QEMU-Libvirt/captures/) — **17 captures** pour les parties A à D, dont :
  - [`C6-01_Comparaison_UUID_MAC.png`](TP1-KVM-QEMU-Libvirt/captures/C6-01_Comparaison_UUID_MAC.png) — comparaison des identités libvirt et réseau ;
  - [`C6-03_Independance_Disques.png`](TP1-KVM-QEMU-Libvirt/captures/C6-03_Independance_Disques.png) — vérification de l'indépendance du clone ;
  - [`D7-01_Controle_Image_OS.png`](TP1-KVM-QEMU-Libvirt/captures/D7-01_Controle_Image_OS.png) — inspection et contrôle de l'image ;
  - [`D8-01_Restauration_Image_OS.png`](TP1-KVM-QEMU-Libvirt/captures/D8-01_Restauration_Image_OS.png) — système restauré et fichier témoin.
- [`preuves/`](TP1-KVM-QEMU-Libvirt/preuves/) — diagnostics, inventaires, configuration XML et sommes de contrôle.
- [`commandes/`](TP1-KVM-QEMU-Libvirt/commandes/) — emplacement prévu pour les commandes reproductibles.

### Points techniques démontrés

**Clone complet :** `virt-clone` a créé une nouvelle définition libvirt et un disque QCOW2 autonome. Les UUID libvirt et adresses MAC sont différents, tandis que le hostname, le `machine-id` et la clé SSH hôte sont restés identiques : le clonage matériel ne généralise pas automatiquement l'OS.

**Image d'OS :** `qemu-img convert` a produit une copie de l'image source, contrôlée avec `qemu-img info`, `qemu-img check` et SHA-256. Un second disque a ensuite été créé depuis cette archive et démarré avec `virt-install --import`, sans installation interactive.

**Bonne pratique :** les captures, clones et conversions des disques système sont effectués **VM arrêtée** ; l'archive reste distincte du disque de travail.

## Prochaines étapes

1. Finaliser la fiche descriptive de l'image d'OS et les réponses du compte rendu.
2. **TP1 — Partie E :** configurer NoCloud dans la VM source, nettoyer Cloud-Init et généraliser une **copie** du disque pour créer `ubuntu-template-v1.qcow2`.
3. **TP1 — Partie F :** déployer et comparer `app01` et `app02` avec des identités distinctes.
4. Terminer les parties G et H, puis le compte rendu structuré.
5. Poursuivre avec le **TP2 — Cloud-Init**.

## Organisation et sécurité

Le dépôt contient les fichiers de documentation et de preuve, **pas** les images de disques QCOW2/RAW volumineuses, ni les clés SSH privées ou secrets. Les images restent dans le laboratoire local ; leur existence et leur intégrité sont documentées par les sorties techniques et les captures.

---

*Travail académique en cours — module Virtualisation et Cloud Computing, Master BD2C, FSAC.*
