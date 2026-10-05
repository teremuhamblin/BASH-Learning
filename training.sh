#!/bin/bash

# ============================
# BASH-Learning v1.0
# Script d'entraînement simple
# ============================

echo "=== BASH-LEARNING v1.0 ==="
echo "Bienvenue dans ton entraînement Bash !"
echo ""

# --- Variables ---
USER_NAME=$(whoami)
DATE=$(date +"%d/%m/%Y - %H:%M")

echo "Utilisateur : $USER_NAME"
echo "Date       : $DATE"
echo ""

# --- Fonction simple ---
function show_menu() {
    echo "1) Afficher l'heure"
    echo "2) Lister les fichiers"
    echo "3) Voir l'utilisation disque"
    echo "4) Quitter"
}

# --- Boucle principale ---
while true; do
    show_menu
    read -p "Choix : " CHOICE

    case $CHOICE in
        1) date ;;
        2) ls -lah ;;
        3) df -h ;;
        4) echo "Fin de session."; exit 0 ;;
        *) echo "Option invalide." ;;
    esac

    echo ""
done
