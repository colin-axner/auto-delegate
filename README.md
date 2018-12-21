# auto-delegate
This scripts needs the packages jq and bc to function.
Install under ubuntu with sudo apt-get install jq bc

Add your Passphrase as String, cosmosvaloper addres(gaiacli keys show keyname --bech=val), your cosmosaddr and save as auto.sh then `chmod +x auto.sh` and then run `./auto.sh`

It will query for STEAK you have unbonded, call them to be distributed, get your next sequence number, and then bond them.
