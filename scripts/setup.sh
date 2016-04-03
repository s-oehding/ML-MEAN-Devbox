#!/bin/bash

clear
echo "Reading config...." >&2
printf "\n"

# if [ -f config/config.yaml ];
# then
# 	source config/config.yaml
# 	echo -e "Virtual Machine IP\t: $vm_ip" >&2
# 	echo -e "Virtual Machine Hostname\t: $vm_hostname" >&2
# 	echo -e "Virtual Machine URL\t: $vm_url" >&2
# 	printf '=%.s' {1..80}
# 	printf "\n"
# else
# 	echo "No configuration file found... Creating a new one"
# 	printf '=%.s' {1..80}
# 	printf "\n"
# fi

# rm config/config.cfg

# Get User input
# --------------------

#System Config
echo -e "Type in the IP for your VM, followed by [ENTER].\n- default:[$vm_ip]:" >&2
read vm_ip
printf "\n"
clear

echo -e "Type in the Hostname for your VM, followed by [ENTER].\n- default:[$vm_hostname]:" >&2
read vm_hostname
printf "\n"
clear

echo -e "Type in the URL for your VM, followed by [ENTER].\n- default:[$vm_url]:" >&2
read vm_url
printf "\n"
clear

#Database Config
echo -e "Type in the Database Name, followed by [ENTER].\n- default:[$vm_db_name]:" >&2
read db_name
printf "\n"
clear

echo -e "Type in the Database Username, followed by [ENTER].\n- default:[$vm_db_user]:" >&2
read db_user
printf "\n"
clear

echo -e "Type in the Database User password, followed by [ENTER].\n- default:[$vm_db_pw]:" >&2
read db_pass
printf "\n"
clear


# Write out Vagrant Config
# --------------------
VCONFIG=$(cat <<EOF
---
configs:
  use: '$vm_hostname'
  $vm_hostname:
    vm_ip: '$vm_ip'
    vm_hostname: '$vm_hostname'
    vm_url: '$vm_url'
    vm_name: '$vm_hostname'
    db_name: '$db_name'
    db_user: '$db_user'
    db_pass: '$db_pass'
EOF
)

echo "$VCONFIG" > config/config.yaml
