###### SECURITY.md >> markdown 
# 🛡️ BASH-Learning
- v1.x

Protocoles de sécurité, normes, restrictions et bonnes pratiques pour scripts Bash

---

### 🔐 1. Objectifs du document
Ce fichier définit les règles de sécurité obligatoires pour tous les scripts Bash du projet BASH-Learning.  
Il garantit :
- la protection du système hôte  
- la prévention des erreurs critiques  
- la conformité aux bonnes pratiques Bash  
- la réduction des risques liés aux entrées utilisateur  

---

### ⚠️ 2. Règles générales de sécurité
- Ne jamais exécuter un script Bash en sudo sauf nécessité absolue.  
- Ne jamais stocker de mots de passe en clair dans un script.  
- Ne jamais exécuter une commande construite à partir d’une entrée utilisateur sans validation stricte.  
- Ne jamais utiliser eval (dangereux et interdit dans ce projet).  
- Ne jamais modifier / supprimer des fichiers système dans les versions 1.x.

---

### 🛡️ 3. Normes obligatoires pour tous les scripts
Chaque script doit obligatoirement contenir :

✔️ Shebang sécurisé
```bash
!/usr/bin/env bash
```

✔️ Mode strict
```bash
set -euo pipefail
```

✔️ Gestion des erreurs
```bash
trap 'echo "[ERREUR] Ligne $LINENO"' ERR
```

✔️ Vérification des dépendances
```bash
command -v ls >/dev/null 2>&1 || { echo "ls manquant"; exit 1; }
```

✔️ Validation des entrées utilisateur
```bash
if [[ ! "$CHOICE" =~ ^[0-9]+$ ]]; then
    echo "Entrée invalide."
    exit 1
fi
```

---

### 🔍 4. Permissions & exécution
- Les scripts doivent être exécutables via :
```bash
chmod +x script.sh
```
- Aucun script ne doit modifier ses propres permissions.  
- Aucun script ne doit écrire dans /etc, /usr, /bin, /root.

---

### 🧱 5. Structure sécurisée des dossiers
```text
BASH-Learning-v1.0/
│── scripts/        # Scripts sécurisés
│── exercices/      # Exercices sans accès système
│── docs/           # Documentation
│── SECURITY.md     # Ce fichier
```

---

### 🧨 6. Commandes interdites dans les versions 1.x
- rm -rf /
- eval
- chmod sur des fichiers système
- chown sur des fichiers système
- curl | bash
- wget | sh
- Toute commande réseau non contrôlée

---

### 🛠️ 7. Commandes autorisées (contrôlées)
- ls, df, du, date
- grep, awk, sed
- mkdir, touch, cat
- netstat (lecture uniquement)

---

### 🔒 8. Politique de mise à jour
Chaque version (v1.1 → v1.8) doit :
- renforcer la sécurité  
- ajouter des validations  
- éviter les commandes dangereuses  
- documenter les changements dans CHANGELOG.md

---

### 🧩 9. Signalement de vulnérabilités
Toute faille doit être signalée via une Issue GitHub avec le tag :
```text
[SECURITY]
```

---

### 🛡️ 10. Licence de sécurité
Ce document est publié sous licence Quantum‑Era Security Protocol v1.0.  
Toute modification doit être validée dans une Pull Request dédiée.
`

---

📍 Où placer le fichier SECURITY.md ?
```text
Tu dois le placer à la racine du projet, exactement ici :

BASH-Learning-v1.0/
│── training.sh
│── aliases.sh
│── exercices/
│── README.md
│── ROADMAP.md
│── CHANGELOG.md
│── SECURITY.md   ← ICI
```

Pourquoi à la racine ?
```text
✔ GitHub le détecte automatiquement  
✔ Les contributeurs le voient immédiatement  
✔ Les scripts peuvent s’y référer  
✔ Les futures versions (v1.1 → v1.8) pourront l’étendre facilement
```

---
