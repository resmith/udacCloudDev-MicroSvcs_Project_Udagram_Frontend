#
# Source: https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/
# https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/
#
echo "run DNSutils pod"
kubectl run -it dnsutils --image gcr.io/kubernetes-e2e-test-images/dnsutils:1.3
#
echo "\n\n*** Confirm DNS registration from pod - dnsutils - run exec 1st"
echo "* exec dnsutils -- nslookup $APP_NAME"
kubectl exec dnsutils -- nslookup $APP_NAME
#
# echo "*** Test from another pod - DNS Utils"
# echo "\n\n*** exec $POD_NAME -- curl http://$APP_NAME:$PORT$API_ENDPOINT"
# kubectl exec dnsutils -- curl -s http://$APP_NAME:$PORT$API_ENDPOINT
# #
# echo "\n\n*** exec $POD_NAME -- curl http://$APP_NAME:$PORT$API_ENDPOINT/"
# kubectl exec dnsutils -- curl -s http://$APP_NAME:$PORT$API_ENDPOINT/
# #

