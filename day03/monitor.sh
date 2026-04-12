#!/bin/bash

echo "===== MONITORAMENTO DO SISTEMA ====="
echo ""

echo "Uso de CPU:"
top -bn1 | grep "Cpu(s)"

echo ""
echo "Uso de Memoria:"
free -h

echo ""
echo "Uso de Disco:"
df -h

echo ""
echo "Tempo Ligado:"
uptime
