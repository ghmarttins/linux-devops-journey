#!/bin/bash

# Definindo limite de CPU
LIMITE=50

# Pegando uso da CPU
USO_CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

echo "Uso atual da CPU: $USO_CPU%"

# Verificando se passou do limite
if [ "$USO_CPU" -gt "$LIMITE" ]; then
    echo "ALERTA: CPU acima de $LIMITE%"
else
    echo "CPU dentro do normal"
fi
