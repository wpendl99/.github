#!/bin/bash

while getopts k:h: flag
do
    case "${flag}" in
        k) key=${OPTARG};;
        h) hostname=${OPTARG};;
    esac
done

if [[ -z "$key" || -z "$hostname" ]]; then
    printf "\nMissing required parameter.\n"
    printf "  syntax: deployall.sh -k <pem key file> -h <hostname>\n\n"
    exit 1
fi

printf "\n-------------------------------\nDeploying all services to with $key\n-------------------------------\n"

cd ../simon-html && ./deployFiles.sh -k ${key} -h ${hostname} -s simon-html
cd ../simon-css && ./deployFiles.sh -k ${key} -h ${hostname} -s simon-css
cd ../simon-javascript && ./deployFiles.sh -k ${key} -h ${hostname} -s simon-javascript
cd ../simon-fetch && ./deployFiles.sh -k ${key} -h ${hostname} -s simon-fetch
cd ../simon-service && ./deployService.sh -k ${key} -h ${hostname} -s simon-service -p 3001
cd ../simon-db && ./deployService.sh -k ${key} -h ${hostname} -s simon-db -p 3002
cd ../simon-react && ./deployReact.sh -k ${key} -h ${hostname} -s simon-react -p 3003

# Deploy the lastest to simon.{hostname} on port 3000
cd ../simon-react && ./deployReact.sh -k ${key} -h ${hostname} -s simon -p 3000

echo cd ../webprogramming260
