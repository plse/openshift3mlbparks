#!/bin/bash -x
NEW_PROJECT=$1
OSE_MASTER=$2
GIT_URL=$3
TEMPLATE_JSON=$4
#ssh -l alice 192.168.122.100 "oc login -u alice --insecure-skip-tls-verify --server=https://ose-master.rhpaas.com:8443"
#ssh -l alice 192.168.122.100 "oc new-project $NEW_PROJECT"
#ssh -l alice 192.168.122.100 "oc project $NEW_PROJECT"
#ssh -l alice 192.168.122.100 "oc new-app https://github.com/plse/cakephp-ex.git"

ssh -l alice 192.168.122.100 "oc login -u alice --insecure-skip-tls-verify --server=$OSE_MASTER"
ssh -l alice 192.168.122.100 "oc new-project $NEW_PROJECT"
ssh -l alice 192.168.122.100 "oc project $NEW_PROJECT"
ssh -l alice 192.168.122.100 "oc process -f $TEMPLATE_JSON | oc create -f -"
