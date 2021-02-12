. ./0_set_env.sh
kubectl delete service udagram-frontend
kubectl expose deployment udagram-frontend --type=NodePort --name=udagram-frontend