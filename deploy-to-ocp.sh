#!/bin/bash

SERVER_URL="https://api.ocp46.crw-qe.com:6443"
USER_NAME="admin"
USER_PASSWORD=""
APPLICATION_NAMESPACE="iokhrime-perf-dev"


oc new-app -n $APPLICATION_NAMESPACE -f ocp/servers-template.yaml


for SERVER_POD in "calc-server-div" "calc-server-sum" "calc-server-sub" "calc-server-mul"
do
    echo ""
    echo "Wait the '$SERVER_POD' pod readiness"

    IS_POD_RUNNING=""

    while [[ -z $IS_POD_RUNNING ]]; do
        echo "    Wai until the '$SERVER_POD' is 'Running'"

    	IS_POD_RUNNING=$(oc get pods -n $APPLICATION_NAMESPACE | grep server | grep --invert-match deploy | grep $SERVER_POD | grep Running)
        sleep 1
    done

done


echo 1


export REACT_APP_DIV_REQUEST_URL="$(oc get routes calc-server-div -o jsonpath="{.spec.port.targetPort}" -n $APPLICATION_NAMESPACE)://$(oc get routes calc-server-div -o jsonpath="{.spec.host}" -n $APPLICATION_NAMESPACE)"
export REACT_APP_MUL_REQUEST_URL="$(oc get routes calc-server-mul -o jsonpath="{.spec.port.targetPort}" -n $APPLICATION_NAMESPACE)://$(oc get routes calc-server-mul -o jsonpath="{.spec.host}" -n $APPLICATION_NAMESPACE)"
export REACT_APP_SUB_REQUEST_URL="$(oc get routes calc-server-sub -o jsonpath="{.spec.port.targetPort}" -n $APPLICATION_NAMESPACE)://$(oc get routes calc-server-sub -o jsonpath="{.spec.host}" -n $APPLICATION_NAMESPACE)"
export REACT_APP_SUM_REQUEST_URL="$(oc get routes calc-server-sum -o jsonpath="{.spec.port.targetPort}" -n $APPLICATION_NAMESPACE)://$(oc get routes calc-server-sum -o jsonpath="{.spec.host}" -n $APPLICATION_NAMESPACE)"


echo $REACT_APP_DIV_REQUEST_URL
echo $REACT_APP_MUL_REQUEST_URL
echo $REACT_APP_SUB_REQUEST_URL
echo $REACT_APP_SUM_REQUEST_URL

echo 2



oc new-app -n $APPLICATION_NAMESPACE -p REACT_APP_DIV_REQUEST_URL=$REACT_APP_DIV_REQUEST_URL -p REACT_APP_MUL_REQUEST_URL=$REACT_APP_MUL_REQUEST_URL -p REACT_APP_SUB_REQUEST_URL=$REACT_APP_SUB_REQUEST_URL -p REACT_APP_SUM_REQUEST_URL=$REACT_APP_SUM_REQUEST_URL -f ocp/front-template.yaml

IS_POD_RUNNING=""

while [[ -z $IS_POD_RUNNING ]]; do
    echo "    Wai until the 'calc-front' is 'Running'"

   	IS_POD_RUNNING=$(oc get pods -n $APPLICATION_NAMESPACE | grep calc-front | grep --invert-match deploy | grep Running)
    sleep 1
done


