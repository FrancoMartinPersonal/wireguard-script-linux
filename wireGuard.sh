#!/bin/sh
deactivate="No such device"

# here you can change de WireGuard name 

wg_name="wg1"

#----------------------------
command='sudo wg show ${wg_name} 2>&1'
#----------------------------
res=$(eval $command)

#colors 
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color
BWhite='\033[1;37m'

#----------------------------
echo "echo res ${res}"

if [[ $res == *$deactivate* ]]
then
  printf "${BWhite}desactivado, ${GREEN}activando ${wg_name}...${NC}"
  eval 'sudo wg-quick up ${wg_name}'
  printf "${GREEN} activado \n"
else
  printf "${BWhite}activado, ${RED}desactivando ${wg_name}...${NC}"
  eval 'sudo wg-quick down ${wg_name}'
    printf "${RED} desactivado \n"
fi




