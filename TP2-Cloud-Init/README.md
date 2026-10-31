# TP2 — Personnalisation et automatisation des VM avec Cloud-Init

**Prérequis :** hyperviseur KVM/libvirt opérationnel et image QCOW2 généralisée obtenue au TP1 (ou image cloud officielle compatible).

## Partie I — Initiation et configuration des VM

- [ ] Exercice 1 — Découvrir Cloud-Init et son architecture.
- [ ] Exercice 2 — Écrire le premier `user-data`.
- [ ] Exercice 3 — Générer une ISO NoCloud (`meta-data` et `cidata`).
- [ ] Exercice 4 — Déployer une VM personnalisée.
- [ ] Exercice 5 — Utilisateurs et authentification SSH par clé.
- [ ] Exercice 6 — Configuration automatique du réseau.
- [ ] Exercice 7 — Paquets, fichiers et commandes (`nginx`).

## Partie II — Industrialisation et déploiement multi-VM

- [ ] Exercice 8 — Profils YAML : web, db et admin.
- [ ] Exercice 9 — Template Jinja2.
- [ ] Exercice 10 — Inventaire YAML et génération de plusieurs VM.
- [ ] Exercice 11 — Diagnostic et dépannage Cloud-Init.
- [ ] Exercice 12 — Mini-projet : web01, db01, admin01.

## Dossiers

- `nocloud/` : fichiers source `user-data`, `meta-data`, `network-config`.
- `profiles/` : configurations YAML des rôles.
- `templates/` : modèles Jinja2.
- `inventory/` : inventaires des VM.
- `generated/` : configurations générées **à contrôler avant publication**.
- `captures/` : preuves du TP, sans secrets.

Ne jamais publier les clés privées SSH, mots de passe, images disque ou ISO seed.
