#!/bin/bash

echo "=== SISTEMA OPERATIVO ==="
cat /etc/os-release | grep -e "^NAME" -e "^VERSION"

echo -e "\n=== UPTIME ==="
uptime -p

echo -e "\n=== PROMEDIO DE CARGA (LOAD AVERAGE) ==="
uptime | awk -F'load average:' '{ print $2 }'

echo -e "\n=== USUARIOS ==="
who

echo -e "\n=== LOGIN FAILED ==="
lastb | head -n 10

echo -e "\n=== USO TOTAL DE CPU ==="
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

