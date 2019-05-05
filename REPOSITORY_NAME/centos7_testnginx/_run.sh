#!/bin/bash

set -u

export LANG=C
export PATH=/sbin:/bin:/usr/sbin:/usr/bin

#readonly FULL0=$( readlink -f $0 )
readonly FULL0=$( cd $( dirname $0 ) && echo $( pwd )/$( basename $0 ) )
readonly DIR=$( dirname ${FULL0} )

readonly IMAGE_NAME=$( echo ${DIR} | awk -F/ '{print $NF}' )
readonly REPO_NAME=$( echo ${DIR} | perl -pe 's%^.*/(.+)/'${IMAGE_NAME}'%$1%' )

set -x
#sudo docker run --net=none              -h ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME} /bin/bash
#sudo docker run --net=bridge            -h ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
 sudo docker run --net=bridge -p 8000:80 -h ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
#sudo docker run --net=bridge -p 8080:81 -h ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
#sudo docker run --net=host              -h ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
