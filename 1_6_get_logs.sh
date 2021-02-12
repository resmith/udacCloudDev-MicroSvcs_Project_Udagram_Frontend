. ./0_set_env.sh
#
echo "*** Info"
echo "APP_NAME: $APP_NAME"
export CONTAINER=$(docker ps --all | grep $APP_NAME | head -n 1 | awk '{print $1;}')
echo "CONTAINER: $CONTAINER"
#
echo "\n*** Logs"
docker logs $CONTAINER