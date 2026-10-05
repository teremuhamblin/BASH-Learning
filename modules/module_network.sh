#!/usr/bin/env bash

module_network() {
    echo "=== MODULE RÉSEAU ==="
    echo "Adresse IP : $(hostname -I)"
    echo "Ping Google :"
    ping -c 2 8.8.8.8
    echo "Ports ouverts :"
    netstat -tulpn 2>/dev/null || echo "netstat non disponible"
}
