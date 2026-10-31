#!/usr/bin/env bash
# TP1 — Partie A — collecte des preuves, sur l'hôte Ubuntu installé dans VMware.
# Aucune modification système : commandes de diagnostic uniquement.
set -u
OUT="$HOME/tp1-kvm/preuves/partie_A_diagnostic_hote.txt"
mkdir -p "$(dirname "$OUT")"
{
  echo '===== TP1 / Partie A : diagnostic de l hôte ====='
  date -Is
  echo '===== Système ====='
  lsb_release -a
  echo '===== CPU ====='
  lscpu
  echo '===== Extensions CPU vmx/svm ====='
  grep -Eoc '(vmx|svm)' /proc/cpuinfo
  echo '===== Modules KVM ====='
  lsmod | grep kvm
  echo '===== Périphérique /dev/kvm ====='
  test -e /dev/kvm && ls -l /dev/kvm
  echo '===== RAM ====='
  free -h
  echo '===== Stockage libvirt ====='
  df -h /var/lib/libvirt
  echo '===== Groupes ====='
  id -nG
  echo '===== Socket libvirt ====='
  systemctl is-active libvirtd.socket
  echo '===== Liste VMs ====='
  virsh -c qemu:///system list --all
  echo '===== Réseau NAT ====='
  virsh -c qemu:///system net-list --all
  echo '===== Outils ====='
  for tool in virt-install virt-clone qemu-img virt-sysprep genisoimage; do
    printf '%s : ' "$tool"
    command -v "$tool" || echo 'NON TROUVÉ'
  done
} | tee "$OUT"
echo "Preuve enregistrée localement : $OUT"
