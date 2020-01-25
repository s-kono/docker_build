#!/bin/bash

readonly M_DIR=$1
set -u

export LANG=C
export LC_CTYPE=en_US.utf8
export PATH=/sbin:/bin:/usr/sbin:/usr/bin

#readonly FULL0=$( readlink -f $0 )
readonly FULL0=$( cd $( dirname $0 ) && echo $( pwd )/$( basename $0 ) )
readonly DIR=$( dirname ${FULL0} )

readonly IMAGE_NAME=$( echo ${DIR} | awk -F/ '{print $NF}' )
readonly REPO_NAME=$( echo ${DIR} | perl -pe 's%^.*/(.+)/'${IMAGE_NAME}'%$1%' )

m_opt=
[[ -n ${M_DIR} ]] && [[ -d ${M_DIR} ]] && m_opt="-v ${M_DIR}:${M_DIR}"

set -x
#docker run --net=none                -h ${IMAGE_NAME} --name ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME} /bin/bash
#docker run --net=bridge  ${m_opt}    -h ${IMAGE_NAME} --name ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
 docker run --net=bridge -p 8000:80   -h ${IMAGE_NAME} --name ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
#docker run --net=bridge -p 8080:88   -h ${IMAGE_NAME} --name ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
#docker run --net=host                -h ${IMAGE_NAME} --name ${IMAGE_NAME} -it --rm ${REPO_NAME}/${IMAGE_NAME}
