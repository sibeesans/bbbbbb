#!/bin/bash
# COLOR VALIDATION
clear
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;32m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[0;32m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
Red='\033[0;91m'         # Red
RED='\033[0;91'          # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
Cyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
CYAN='\033[1;96m'        # Cyan
YELLOW='\033[0;33m'      # Yellow
NC='\e[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
KN='\033[0;33m'
ORANGE='\033[0;33m'
PINK='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
#Download/Upload today
daily_usage=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
monthly_usage=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')
DATE=`date -d "0 days" +"%d-%m-%Y"`

# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information

clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | Geo Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON${NC}"
else
   status_ssh="${RED}OFF${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON${NC}"
else
    status_ws_epro="${RED}OFF${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON${NC}"
else
   status_haproxy="${RED}OFF${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON${NC}"
else
   status_xray="${RED}OFF${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON${NC}"
else
   status_nginx="${RED}OFF${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON${NC}"
else
   status_dropbear="${RED}OFF${NC} "
fi

echo -e " "
echo -e "\E[44;1;39m ꧁࿇ SCRIPT SEDERHANA PENUH CINTA ࿇꧂ \E[0m"
echo -e ""
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${Blue}│$NC\033[46m                    SYSTEM INFORMATION                    $NC${Blue}│$NC"
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${Blue}│$NC System OS${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${Blue}│$NC Server RAM${NC}    $Blue=$NC $RAM MB $NC"
echo -e " ${Blue}│$NC Usage RAM${NC}     $Blue=$NC $USAGERAM MB $NC"
echo -e " ${Blue}│$NC Usage Memory${NC}  $Blue=$NC $MEMOFREE${NC}"
echo -e " ${Blue}│$NC LoadCPU${NC}       $Blue=$NC $LOADCPU%${NC}"
echo -e " ${Blue}│$NC Uptime Server${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${Blue}│$NC Core System${NC}   $Blue=$NC $CORE${NC}"
echo -e " ${Blue}│$NC Date${NC}          $Blue=$NC $DATEVPS${NC}"
echo -e " ${Blue}│$NC Time${NC}          $Blue=$NC $TIMEZONE${NC}"
echo -e " ${Blue}│$NC IP VPS${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " ${Blue}│$NC Domain${NC}        $Blue=$NC $domain${NC}"
echo -e " ${Blue}│$NC Expiry script${NC} $Blue=$green LifeTime"
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${Blue}╭════════════════╮${NC}${Blue}╭══════════════════╮${NC}${Blue}╭════════════════════╮${NC}"
echo -e " ${Blue}│ ${NC} SSH : $status_ssh" "         NGINX : $status_nginx" "         XRAY : $status_xray         $NC${Blue}│$NC" 
echo -e " ${Blue}│ ${NC} WS-ePRO : $status_ws_epro" "     DROPBEAR : $status_dropbear" "      HAPROXY : $status_haproxy      $NC${Blue}│$NC" 
echo -e " ${Blue}╰════════════════╯${NC}${Blue}╰══════════════════╯${NC}${Blue}╰════════════════════╯${NC}"
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${Blue}│\033[0;33m  ${WB}Hari ini\033[0;36m $DATE \033[0;33m  Bulan\033[0;36m $(date +%B-%Y)${Blue}                   │$NC"
echo -e " ${Blue}│\033[0;33m  Total: \033[0;32m$daily_usage${NC}       \033[0;33mTotal: \033[0;32m$monthly_usage${Blue}                           │$NC" 
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${Blue}│$NC [${green}01${NC}] SSH MENU     ${Blue}│$NC [${green}08${NC}] DELL ALL EXP ${Blue}│$NC [${green}15${NC}] BCKP/RSTR   $NC${Blue}│$NC" 
echo -e " ${Blue}│$NC [${green}02${NC}] VMESS MENU   ${Blue}│$NC [${green}09${NC}] AUTOREBOOT  ${Blue} │$NC [${green}16${NC}] REBOOT      $NC${Blue}│$NC"    
echo -e " ${Blue}│$NC [${green}03${NC}] VLESS MENU   ${Blue}│$NC [${green}10${NC}] INFO PORT   ${Blue} │$NC [${green}17${NC}] RESTART     $NC${Blue}│$NC"   
echo -e " ${Blue}│$NC [${green}04${NC}] TROJAN MENU  ${Blue}│$NC [${green}11${NC}] SPEEDTEST   ${Blue} │$NC [${green}18${NC}] DOMAIN      $NC${Blue}│$NC" 
echo -e " ${Blue}│$NC [${green}05${NC}] SHADOW MENU  ${Blue}│$NC [${green}12${NC}] RUNNING     ${Blue} │$NC [${green}19${NC}] CERT SSL    $NC${Blue}│$NC"
echo -e " ${Blue}│$NC [${green}06${NC}] TRIAL MENU   ${Blue}│$NC [${green}13${NC}] CLEAR LOG   ${Blue} │$NC [${green}20${NC}] INSTAL UDP  $NC${Blue}│$NC"
echo -e " ${Blue}│$NC [${green}07${NC}] VPS INFO     ${Blue}│$NC [${green}14${NC}] CREATE SLOW ${Blue} │$NC [${green}21${NC}] CLEAR CACHE $NC${Blue}│$NC"
echo -e " ${Blue}│                                                          $NC${Blue}│$NC"
echo -e " ${Blue}│$NC [${green}00${NC}] BACK TO EXIT MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC \E[0m\033[0;34m                              $NC${Blue}│$NC"
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e "${GREEN} ༺ ${BLUE}𒆜${RED}▁ ${CYAN}▂ ${GREEN}▄ ${ORANGE}▅${PINK} ▆${GREEN} ▇ ${RED}█${BLUE}𒆜${CYAN} ༻${NC}  SCRIPT ARYA BLITAR ${BLUE}༺ ${RED}𒆜${GREEN}█ ${ORANGE}▇ ${CYAN}▆ ${RED}▅ ${GREEN}▄ ${ORANGE}▂ ${PINK}▁${BLUE}𒆜 ${CYAN}༻                   \E[0m"
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${Blue}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${Blue}│$NC Version       ${Blue}=$NC V3.0"
echo -e " ${Blue}│$NC User          ${Blue}=$GREEN Nita"
echo -e " ${Blue}│$NC Script Status ${Blue}=$GREEN Aktif Forever $sts "
echo -e " ${Blue}╰══════════════════════════════════════════════════════════╯${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
m-trial
;;
7 | 07)
clear
gotop
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
xp
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
9 | 09)
clear
autoreboot
;;
10)
clear
prot
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
11)
clear
speedtest
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
12)
clear
run
;;
13)
clear
clearlog
;;
14)
clear
sd
;;
15)
clear
menu-backup
;;
16)
clear
reboot
;;
17)
clear
restart
;;
18)
clear
addhost
;;
19)
clear
fixcert
;;
20)
clear
echo -e "${green}ANDA YAKIN UNTUK MEMASANG SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
echo -e ""
read -p "SUDAH LAPOR KE ADMIN ? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  echo -e "${green}START. . . $NC"
elif [[ $arg == 'y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  clear
  echo -e "${Blue}START . . .$NC"
elif [[ $arg == 'N' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  menu
  exit 0
elif [[ $arg == 'n' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
else
  echo -e "${RED}Argumen Tidak Diketahui! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
fi
##########
clear
wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp
;;
21)
clear
clearcache
;;
0 | 00)
figlet BZ OFFICIAL
exit
;;
x)
menu
;;
*)
echo -e ""
menu
;;
esac
