#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "❌ Execute como root (sudo)"
  exit 1
fi

# Verifica se variáveis estão definidas
if [ -z "$TELEGRAM_TOKEN" ] || [ -z "$TELEGRAM_CHAT_ID" ]; then
  echo "❌ Variáveis TELEGRAM_TOKEN e TELEGRAM_CHAT_ID não definidas"
  exit 1
fi

SERVICOS=("ssh" "cron")
LOG="log_servicos.txt"

enviar_telegram() {
  local mensagem="$1"
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$mensagem" > /dev/null
}

echo -e "\n===== VERIFICACAO DE SERVICOS =====" | tee -a "$LOG"
date | tee -a "$LOG"

for servico in "${SERVICOS[@]}"
do
  if systemctl is-active --quiet "$servico"; then
    echo "✅ $servico está rodando" | tee -a "$LOG"
  else
    echo "❌ $servico está parado. Tentando reiniciar..." | tee -a "$LOG"
    enviar_telegram "⚠️ ALERTA: o serviço $servico caiu em $(hostname)"

    systemctl restart "$servico"

    if systemctl is-active --quiet "$servico"; then
      echo "🔄 $servico reiniciado com sucesso" | tee -a "$LOG"
      enviar_telegram "✅ $servico reiniciado com sucesso em $(hostname) às $(date '+%H:%M:%S')"
    else
      echo "⚠️ Falha ao reiniciar $servico" | tee -a "$LOG"
      enviar_telegram "❌ ALERTA CRÍTICO: falha ao reiniciar $servico em $(hostname)"
    fi
  fi
done

echo "===================================" | tee -a "$LOG"
