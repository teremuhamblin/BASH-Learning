#!/usr/bin/env bash

module_system() {
    echo "=== MODULE SYSTÈME ==="
    echo "Utilisateur : $(whoami)"
    echo "OS : $(uname -a)"
    echo "CPU : $(lscpu | grep 'Model name')"
    echo "RAM : $(free -h | grep Mem)"
    echo "Disque :"
    df -h
}
