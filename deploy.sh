#!/bin/bash -x
OSE_MASTER=$1
NEW_PROJECT=$2
APP_NAME=$3
APP_DOMAIN=$4
GIT_URL=$5
#ssh -l alice 192.168.122.100 "oc login -u alice --insecure-skip-tls-verify --server=https://ose-master.rhpaas.com:8443"
#ssh -l alice 192.168.122.100 "oc new-project $NEW_PROJECT"
#ssh -l alice 192.168.122.100 "oc project $NEW_PROJECT"
#ssh -l alice 192.168.122.100 "oc new-app https://github.com/plse/cakephp-ex.git"

ssh -l alice 192.168.122.100 "oc login -u alice --insecure-skip-tls-verify --server=$OSE_MASTER"
ssh -l alice 192.168.122.100 "oc new-project $NEW_PROJECT"
ssh -l alice 192.168.122.100 "oc project $NEW_PROJECT"
ssh -l alice 192.168.122.100 "oc process -f $TEMPLATE_JSON -v APPLICATION_NAME=$APP_NAME,APPLICATION_DOMAIN=$APP_DOMAIN,GIT_URL=$GIT_URL| oc create -f -"
