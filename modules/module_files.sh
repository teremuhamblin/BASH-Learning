#!/usr/bin/env bash

module_files() {
    echo "=== MODULE FICHIERS ==="
    read -p "Chemin à analyser : " PATH_TO_CHECK

    if [[ -d "$PATH_TO_CHECK" ]]; then
        echo "Contenu :"
        ls -lah "$PATH_TO_CHECK"
    else
        echo "Chemin invalide."
    fi
}
