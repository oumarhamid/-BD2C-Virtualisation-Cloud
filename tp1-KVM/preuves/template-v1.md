# Fiche technique — Template Ubuntu v1

## Identification
- Système : Ubuntu Server 24.04.5 LTS
- Architecture : x86_64
- Version : ubuntu-template-v1
- Date : 11/11/2026
- Image : ubuntu-template-v1.qcow2
- Format : QCOW2
- Capacité virtuelle : 15 Gio
- Occupation observée : environ 4,17 Gio

## Configuration matérielle
- Processeurs : 2 vCPU
- Mémoire : 2048 Mio
- Machine : pc-q35-noble
- Firmware : BIOS probable (aucun chargeur UEFI déclaré dans le XML)
- Stockage : VirtIO
- Réseau : VirtIO, NAT default, DHCP
- Canal : QEMU Guest Agent

## Logiciels communs
- OpenSSH Server
- Cloud-Init
- QEMU Guest Agent
- Fichier commun : /opt/tp1/version.txt (v1)

## Préparation Cloud-Init
- Datasources : NoCloud, None
- preserve_hostname : false
- ssh_deletekeys : true
- Génération des clés SSH : RSA, ECDSA, Ed25519

## Nettoyage effectué
- cloud-init clean --logs --seed
- virt-sysprep : machine-id
- virt-sysprep : ssh-hostkeys
- virt-sysprep : udev-persistent-net
- virt-sysprep : logfiles
- virt-sysprep : tmp-files
- virt-sysprep : bash-history

## Compte conservé et restrictions
- Compte pédagogique local : tpuser
- Image réservée au laboratoire
- Aucun mot de passe documenté ici
- Nettoyage non équivalent à un audit complet des secrets
- Ne jamais démarrer directement le template en écriture

## Intégrité
- qemu-img check : aucune erreur détectée
- Empreinte SHA256 : voir template.sha256

## Personnalisation au déploiement
- Hostname propre à chaque instance
- machine-id distinct
- Clés SSH hôte distinctes
- instance-id Cloud-Init distinct
- Configuration transmise par support NoCloud

## Tests de déploiement
- app01 : en attente (exercice 10)
- app02 : en attente (exercice 10)
- Validation fonctionnelle finale : en attente
