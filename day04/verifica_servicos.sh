#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "❌ Execute como root (sudo)"
  exit 1
fi

SERVICOS=("ssh" "sshd" "cron")
LOG="log_servicos.txt"

echo -e "\n===== VERIFICACAO DE SERVICOS =====" | tee -a $LOG
date | tee -a $LOG

for servico in "${SERVICOS[@]}"
do
    if systemctl is-active --quiet $servico; then
        echo "✅ $servico está rodando" | tee -a $LOG
    else
        echo "❌ $servico está parado. Reiniciando..." | tee -a $LOG
        
        systemctl restart $servico
        
        if [ $? -eq 0 ]; then
            echo "🔄 $servico reiniciado com sucesso" | tee -a $LOG
        else
            echo "⚠️ Falha ao reiniciar $servico" | tee -a $LOG
        fi
    fi
done

echo "===================================" | tee -a $LOG
