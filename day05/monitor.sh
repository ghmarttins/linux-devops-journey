#!/bin/bash

LOG="monitoramento.log"

echo "===== MONITORAMENTO $(date) =====" >> $LOG

echo "Uso de CPU:" >> $LOG
top -bn1 | grep "Cpu(s)" >> $LOG

echo "Uso de Memória:" >> $LOG
free -h >> $LOG

echo "Uso de Disco:" >> $LOG
df -h >> $LOG

echo "==============================" >> $LOG
