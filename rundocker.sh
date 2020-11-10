DEFAULT_DOCKER_IMAGE="pbssl:1.0"
DEFAULT_CONTAINER_NAME="pb"

WORK_DIR=`pwd`
CONTAINER_WORK_DIR=$WORK_DIR

CONTAINER_NAME=$DEFAULT_CONTAINER_NAME
DOCKER_IMAGE=$DEFAULT_DOCKER_IMAGE

# Executando o docker
docker run  -it \
            --user=$(id -u) \
            --env="DISPLAY" \
            --env="QT_X11_NO_MITSHM=1" \
            --name=$CONTAINER_NAME \
            --memory=1024g \
            --oom-kill-disable \
            --ipc="host" \
            --volume="/dev:/dev" \
            --privileged \
            --net=host \
            --volume="${WORK_DIR}:${CONTAINER_WORK_DIR}" \
            --volume="/etc/group:/etc/group:ro" \
            --volume="/etc/passwd:/etc/passwd:ro" \
            --volume="/etc/shadow:/etc/shadow:ro" \
            --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
            --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
            $1  \
            $DOCKER_IMAGE

docker container rm $CONTAINER_NAME -f
