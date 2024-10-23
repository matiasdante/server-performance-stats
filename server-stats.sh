#!/bin/bash

# Mostrar el uso total de la CPU, CPU disponible y CPU usado
echo "=== USO TOTAL DE CPU ==="
cpu_info=$(top -bn1 | grep "Cpu(s)")
cpu_usado=$(echo "$cpu_info" | awk '{print $2}')
cpu_sistema=$(echo "$cpu_info" | awk '{print $4}')
cpu_idle=$(echo "$cpu_info" | awk '{print $8}')
cpu_total=100

echo "CPU Total: ${cpu_total}%"
echo "CPU Usado (usuario + sistema): $(awk "BEGIN {print $cpu_usado + $cpu_sistema}")%"
echo "CPU Disponible (idle): ${cpu_idle}%"

# Mostrar el uso total de memoria (libre vs usado)
echo -e "\n=== USO DE MEMORIA ==="
free -h

# Mostrar el uso de disco (libre vs usado)
echo -e "\n=== USO DE DISCO ==="
df -h

# Mostrar los 5 procesos con mayor uso de CPU
echo -e "\n=== TOP 5 PROCESOS POR USO DE CPU ==="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Mostrar los 5 procesos con mayor uso de memoria
echo -e "\n=== TOP 5 PROCESOS POR USO DE MEMORIA ==="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

