echo -e "\033[1;34m TraceHunter-Forensi Collector \033[0m"
if [[ $EUID -ne 0 ]]; then
	echo -e "\033[1;31m Este script precisa ser executado como root \033[0m"
	exit 1
fi
COLLECTED_DIR="collected_files"
mkdir -p "$COLLECTED_DIR"
echo -e "\033[1;35m Coletando arquivos do sistema... \033[0m"
echo -e "\033[0;95m Listando informações sobre discos e partições... \033[0m"
lsblk > "$COLLECCTED_DIR/disk_info.txt"
echo -e "\033[0;95m Coletando informações de rede... \033[0m"
ss -tunapl > "$COLLECCTED_DIR/active_connections.txt"
netstat -tunapl > "$COLLECCTED_DIR/open_ports.txt"
echo -e "\033[0;95m Coletando lista de processos... \033[0m"
ps aux > "$COLLECTED_DIR/process_list.txt"
echo -e "\033[0;95m Coletando logs do sistema... \033[0m"
cp /var/log/syslog "$COLLECTED_DIR/syslog.log"
cp /var/log/auth.log "$COLLECTED_DIR/auth.log"
cp /var/log/dmesg "$COLLECTED_DIR/dmesg.log"
echo -e "\033[0;95m Coletando arquivos de configuração... \033[0m"
cp -r /etc "$COLLECTED_DIR/etc backup"
echo -e "\033[0;95m Listando o diretório raiz... \033[0m"
ls -la / > "$COLLECTED_DIR/root_dir_list.txt"
DATE_COLLECT=$(date "+%Y-%m-%d")
HOSTNAME=$(hostname)
OUTPUT_FILE="TraceHunter_${HOSTNAME}_${DATE_COLLECT}.tar.gz"
tar -czf "$OUTPUT_FILE" root_dir_list.txt





