#!/bin/bash

echo "===== LIMPEZA DO SISTEMA ====="
echo ""

echo "Espaco antes da limpeza:"
df -h

echo ""
echo "Limpando arquivos temporarios..."

rm -rf /tmp/*

echo ""
echo "Espaco depois da limpeza:"
df -h
