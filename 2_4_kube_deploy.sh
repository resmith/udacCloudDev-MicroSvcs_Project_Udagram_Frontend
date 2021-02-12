. ./0_set_env.sh
#
# In case Docker image is changed
# otherwise kube will say 'unchanged' because of no change to deployment.yaml
echo "*** Delete previous deploy & service"
kubectl delete -f ./deployment.yaml
kubectl delete -f ./service.yaml
#
echo "\n*** Apply service"
kubectl apply -f ./service.yaml
echo "\n*** Apply deployment"
kubectl apply -f ./deployment.yaml
#
echo "\n*** get all"
kubectl get all