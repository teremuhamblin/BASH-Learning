#!/usr/bin/env bash
set -euo pipefail
trap 'echo "[ENGINE ERROR] Ligne $LINENO"' ERR

# ============================================
# BASH-Learning v2.0 — ENGINE
# Quantum-Era Core Engine v2.0
# ============================================

ENGINE_VERSION="2.0"

# --- Chargement des modules ---
MODULES_DIR="$(dirname "$0")/../modules"

load_module() {
    local module="$1"
    if [[ -f "$MODULES_DIR/$module" ]]; then
        source "$MODULES_DIR/$module"
        echo "[ENGINE] Module chargé : $module"
    else
        echo "[ENGINE] Module introuvable : $module"
    fi
}

# --- Vérification des dépendances ---
check_dep() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "[ENGINE] Dépendance manquante : $1"
        exit 1
    }
}

# --- Menu dynamique ---
show_menu() {
    echo "=== BASH-LEARNING v2.0 ==="
    echo "1) Module Système"
    echo "2) Module Réseau"
    echo "3) Module Fichiers"
    echo "4) Module Automatisation"
    echo "5) Quitter"
}

# --- Boucle principale ---
main() {
    load_module "module_system.sh"
    load_module "module_network.sh"
    load_module "module_files.sh"
    load_module "module_automation.sh"

    while true; do
        show_menu
        read -p "Choix : " CHOICE

        case "$CHOICE" in
            1) module_system ;;
            2) module_network ;;
            3) module_files ;;
            4) module_automation ;;
            5) echo "[ENGINE] Fin de session."; exit 0 ;;
            *) echo "[ENGINE] Choix invalide." ;;
        esac
        echo ""
    done
}

main
