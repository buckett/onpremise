#!/bin/bash
# 
# This creates a self signed certificate which can be used by nginx
# for serving HTTPS
# 
# Usage: create-certs.sh {hostname}

folder=certs
hostname=${1-localhost}

if [ ! -d $folder ]; then
  mkdir $folder
fi

openssl req -sha256 -x509 -nodes -newkey rsa:2048 \
  -subj "/C=GB/ST=Oxfordshire/L=Oxford/O=University of Oxford/OU=IT Services/CN=${hostname}" \
  -keyout $folder/${hostname}.key -out $folder/${hostname}.crt -days 375


