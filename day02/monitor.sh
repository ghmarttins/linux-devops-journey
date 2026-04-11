#!/bin/bash

echo "===== RELATORIO DO SISTEMA ====="
echo ""

echo "CPU:"
top -b -n1 | head -5

echo ""
echo "Memoria:"
free -h

echo ""
echo "Disco:"
df -h

echo ""
echo "Usuarios logados:"
who

echo ""
echo "Tempo de atividade:"
uptime
