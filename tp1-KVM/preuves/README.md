# Partie A — Inventaire des preuves

Les captures incluses sont issues des sorties de terminal réellement communiquées pendant le TP.

## Captures déjà disponibles

- `A2-01_Groupes_socket_et_connexion_libvirt.png` : groupes `libvirt`, `kvm`; socket `active`; `virsh list --all` sans VM.
- `A2-02_Service_libvirtd_actif.png` : service `libvirtd` dans l'état `active (running)`.
- `A2-03_Disponibilite_des_outils.png` : chemins des cinq exécutables exigés page 5.

## Captures manquantes

- `A1-01_Diagnostic_virtualisation_KVM.png` : `lscpu`, `grep -Eoc '(vmx|svm)' /proc/cpuinfo`, `lsmod | grep kvm`, `/dev/kvm`, `free -h`, `df -h /var/lib/libvirt`, depuis l'installation Ubuntu actuelle.
- `A2-04_Reseau_NAT_default.png` : `virsh -c qemu:///system net-list --all` montrant `default active yes yes`.

## Résultats observés et vérifiables

- Ubuntu 24.04.5 LTS, `/dev/kvm` présent.
- RAM 2,9 Gio, swap 2,9 Gio, espace disponible sur `/` 84 Go au moment du relevé.
- `libvirt` et `kvm` figurent dans `id -nG`.
- `libvirtd.socket` actif ; `libvirtd.service` actif lors de la capture.
- `virsh -c qemu:///system list --all` affiche une liste vide sans erreur.
- `virsh -c qemu:///system net-list --all` a affiché `default active yes yes` dans les sorties textuelles communiquées.
- Les outils `virt-install`, `virt-clone`, `qemu-img`, `virt-sysprep`, `genisoimage` ont été localisés sous `/usr/bin/`.

**À ne pas publier :** ISO, QCOW2, VMDK, secrets et clés privées. Le fichier de preuve généré par le script est local dans Ubuntu et doit être vérifié avant copie vers GitHub.
