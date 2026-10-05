#!/usr/bin/env bash

module_automation() {
    echo "=== MODULE AUTOMATISATION ==="
    echo "Tâches cron actuelles :"
    crontab -l 2>/dev/null || echo "Aucune tâche cron."
}
