#!bin/bash

echo "===== MONITORAMENTO DO SISTEMA ====="
echo ""

echo "Uso de CPU:"
top -bn1 | grep "CPu(s)"

echo""
echo "Uso de Memória"
free -h

echo ""
echo "Uso de Disco"

df -h

echo ""
echo "Tempo Ligado:"
uptime



