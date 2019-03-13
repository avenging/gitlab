#!/bin/bash
kubectl apply -f gitlab-setup.yml
NAME=`../kubectl get secrets -o jsonpath="{$.items.*['metadata']['name']}" | egrep -o "\<gitlab-token.*\>"`
echo $NAME
echo Token:
../kubectl get secret $NAME -o jsonpath="{['data']['token']}" | base64 --decode
echo
echo Certificate:
../kubectl get secret $NAME -o jsonpath="{['data']['ca\.crt']}" | base64 --decode
echo API URL:
kubectl cluster-info
