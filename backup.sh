#!/bin/bash
DIR='namespaces'
for NAMESPACE in $(kubectl get -o=name namespaces | cut -d '/' -f2)
do
	for TYPE in $(kubectl get -n $NAMESPACE -o=name pvc,configmap,serviceaccount,ingress,service,deployment,statefulset,cronjob,daemonset)
	do
		mkdir -p $(dirname $DIR/$NAMESPACE/$TYPE)
		kubectl get -n $NAMESPACE -o=yaml $TYPE > $DIR/$NAMESPACE/$TYPE.yaml
	done
done
