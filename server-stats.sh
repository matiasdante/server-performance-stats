#!/bin/bash

echo "=== USO TOTAL DE CPU ==="
cpu_info=$(top -bn1 | grep "Cpu(s)")
cpu_usado=$(echo "$cpu_info" | awk '{print $2}')
cpu_sistema=$(echo "$cpu_info" | awk '{print $4}')
cpu_idle=$(echo "$cpu_info" | awk '{print $8}')
cpu_total=100

echo "CPU Total: ${cpu_total}%"
echo "CPU Usado (usuario + sistema): $(awk "BEGIN {print $cpu_usado + $cpu_sistema}")%"
echo "CPU Disponible (idle): ${cpu_idle}%"

echo -e "\n=== USO DE MEMORIA ==="
free -h

echo -e "\n=== USO DE DISCO ==="
df -h

echo -e "\n=== USO DE MEMORIA ==="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e "\n=== TOP 5 PROCESOS POR USO DE MEMORIA ==="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

