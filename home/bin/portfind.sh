sudo ls -lah /proc/`ss -tulpn | grep $1 | cut -d'=' -f2 | cut -d',' -f1`/exe | cut -d' ' -f12
