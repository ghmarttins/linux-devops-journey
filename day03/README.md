# Day 03 - Linux Monitoring and Cleanup Scripts

Neste dia foram desenvolvidos scripts em Bash com foco em monitoramento e manutenção básica no Linux.

## Scripts criados

### 1. monitor.sh
Exibe informações básicas do sistema:
- uso de CPU
- uso de memória
- uso de disco
- tempo ligado do sistema

### 2. alert.sh
Verifica o uso atual da CPU e compara com um limite definido no script.
Se o valor ultrapassar o limite, exibe um alerta.

### 3. limpeza.sh
Mostra o espaço em disco antes e depois da tentativa de limpeza de arquivos temporários em `/tmp`.

## Comandos utilizados

- `top -bn1`
- `grep`
- `free -h`
- `df -h`
- `uptime`
- `rm -rf /tmp/*`

## Conceitos praticados

- automação com Bash
- variáveis
- condicionais com `if`
- pipes (`|`)
- redirecionamento com `>` e `>>`
- permissões no Linux
- monitoramento básico de sistema

## Aprendizados importantes

- Um arquivo pode parecer correto no GitHub e ainda falhar no Linux ao executar.
- O uso incorreto de `>>` pode alterar o script em vez de gerar um log.
- Nem todos os arquivos em `/tmp` podem ser removidos sem permissões elevadas.

