. ./0_set_env.sh
#
echo "*** Delete previous deploy & service"
kubectl delete -f ./ingress.yaml
#
echo "\n*** Apply service"
kubectl apply -f ./ingress.yaml
#
echo "\n*** get all"
kubectl get all