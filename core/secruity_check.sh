#!/usr/bin/env bash
set -euo pipefail
trap 'echo "[SECURITY ERROR] Ligne $LINENO"' ERR

# ============================================
# BASH-Learning v2.0 — SECURITY CHECK
# Quantum-Era Security Scanner v2.0
# ============================================

TARGET_DIR="$(dirname "$0")/.."

echo "=== SECURITY SCAN v2.0 ==="
echo "Scan du dossier : $TARGET_DIR"
echo ""

dangerous_patterns=(
    "eval"
    "rm -rf /"
    "curl | bash"
    "wget | sh"
)

check_file() {
    local file="$1"
    echo "[SCAN] Analyse : $file"

    # Vérification du header
    if ! grep -q "#!/usr/bin/env bash" "$file"; then
        echo "  ⚠ Header manquant"
    fi

    # Vérification du strict mode
    if ! grep -q "set -euo pipefail" "$file"; then
        echo "  ⚠ Strict mode manquant"
    fi

    # Recherche de patterns dangereux
    for pattern in "${dangerous_patterns[@]}"; do
        if grep -q "$pattern" "$file"; then
            echo "  ❌ Pattern dangereux détecté : $pattern"
        fi
    done

    echo ""
}

# Scan de tous les scripts
find "$TARGET_DIR" -type f -name "*.sh" | while read -r script; do
    check_file "$script"
done

echo "=== SECURITY SCAN TERMINÉ ==="
