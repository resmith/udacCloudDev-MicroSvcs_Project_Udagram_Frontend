. ./0_set_env.sh
#
echo "*** Info"
echo "APP_NAME: $APP_NAME"
export POD_NAME=$(kubectl get pods -o custom-columns=NAME:.metadata.name | grep $APP_NAME | head -n 1 | awk '{print $1;}')
echo "POD_NAME: $POD_NAME"
#
echo "\n*** Logs"
kubectl logs $POD_NAME