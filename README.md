# 🕵️‍♂️ TraceHunter – Forensic Collector

### Um script Bash simples e automatizado para coleta de artefatos forenses em sistemas Linux.
#### Ele reúne informações essenciais para análise de incidentes, organiza tudo em uma pasta e exporta em um arquivo .tar.gz com nome baseado em hostname e data.

## 🔍 O que o script coleta

- Discos e partições (lsblk)

- Conexões de rede ativas (ss)

- Portas abertas (netstat)

- Lista de processos em execução (ps aux)

- Logs importantes do sistema:

  * /var/log/syslog

  * /var/log/auth.log

  * /var/log/dmesg

- Cópia do diretório /etc (configurações e serviços)

- Listagem completa do diretório raiz (ls -la /)

### Tudo é salvo na pasta collected_files/ e depois compactado em um arquivo:

```bash
TraceHunter_<hostname>_<data>.tar.gz
```
## ⚙️ Requisitos

- Sistema operacional Linux

- Permissão de superusuário (precisa ser executado como root)

- Ferramentas instaladas: bash, tar, lsblk, ss, netstat, ps, etc.

## 🚀 Como usar

- Dê permissão de execução:

```bash
chmod +x tracehunter.sh
 ```


- Execute como root:

```bash
sudo ./tracehunter.sh
```

### Após a coleta, o arquivo compactado será gerado no mesmo diretório do script.

- Estrutura gerada
```collected_files/
├── disk_info.txt
├── active_connections.txt
├── open_ports.txt
├── process_list.txt
├── syslog.log
├── auth.log
├── dmesg.log
├── etc backup/
└── root_dir_list.txt

TraceHunter_<hostname>_<date>.tar.gz
```
## ⚠️ Avisos importantes

- O script faz cópias completas de /etc, o que pode gerar arquivos pesados.

- Nunca execute em máquinas de produção sem autorização.

- Usado exclusivamente para fins forenses, educacionais ou auditoria interna.
