#!/bin/bash

args=($@)

if [ $# -lt 1 ]; then
	echo "[-] Need target"
	echo "[+] Usage: rvipcheck.sh [TARGET]"
	echo "[+] Target is an IP or domain"
else
	proxy=''
	if [[ " ${args[@]} " =~ " --use-proxy " ]]; then
		proxy=$(shuf -n 1 proxy_list)
    		echo "[+] Using proxy: $proxy"
		proxy="--proxy $proxy"
	fi

	cmd="curl $proxy -s --max-time 10 'http://api.hackertarget.com/reverseiplookup/?q=${args[0]}' --compressed"
	
	res="$(eval $cmd)"
#	echo "$cmd"
#	echo "$res"
	echo "$res"
fi
