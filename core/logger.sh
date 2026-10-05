#!/usr/bin/env bash

# ============================================
# BASH-Learning v2.0 — LOGGER
# Quantum-Era Logging System v2.0
# ============================================

LOG_FILE="/tmp/bash_learning.log"

log_info() {
    echo "[INFO] $1"
    echo "$(date +"%F %T") [INFO] $1" >> "$LOG_FILE"
}

log_warn() {
    echo "[WARN] $1"
    echo "$(date +"%F %T") [WARN] $1" >> "$LOG_FILE"
}

log_error() {
    echo "[ERROR] $1"
    echo "$(date +"%F %T") [ERROR] $1" >> "$LOG_FILE"
}
