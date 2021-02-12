. ./0_set_env.sh
#
echo "APP_NAME: $APP_NAME"
export POD_NAME=$(kubectl get pods -o custom-columns=NAME:.metadata.name | grep $APP_NAME | head -n 1 | awk '{print $1;}')
export CLUSTERIP=$(kubectl get svc  -o custom-columns=CLUSTER-IP:.metadata.name | grep $APP_NAME | head -n 1 | awk '{print $1;}')
echo "POD_NAME: $POD_NAME"
echo "CLUSTERIP: $CLUSTERIP"
#
echo "*** Test API from within the API pod"
echo "* exec $POD_NAME -- curl $BASE_URL:$PORT$API_ENDPOINT"
kubectl exec $POD_NAME -- curl -s $BASE_URL:$PORT$API_ENDPOINT
#
echo "\n\n* exec $POD_NAME -- curl $BASE_URL:$PORT$API_ENDPOINT/"
kubectl exec $POD_NAME -- curl -s $BASE_URL:$PORT$API_ENDPOINT/
#
# echo "*** Test API from outside the API pod"
# echo "curl $BASE_URL:$PORT$API_ENDPOINT"
# curl -s $BASE_URL:$PORT$API_ENDPOINT
# #
# echo "curl $BASE_URL:$PORT$API_ENDPOINT/"
# curl -s $BASE_URL:$PORT$API_ENDPOINT/
#
# exec udagram-frontend-7dfb6b65dd-rwp4z -- curl http://localhost:80