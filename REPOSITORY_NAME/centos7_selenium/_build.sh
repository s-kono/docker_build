#!/bin/bash

args=$*

set -u

export LANG=C
export PATH=/sbin:/bin:/usr/sbin:/usr/bin

_proxy=

#readonly FULL0=$( readlink -f $0 )
readonly FULL0=$( cd $( dirname $0 ) && echo $( pwd )/$( basename $0 ) )
readonly DIR=$( dirname ${FULL0} )

readonly IMAGE_NAME=$( echo ${DIR} | awk -F/ '{print $NF}' )
readonly REPO_NAME=$( echo ${DIR} | perl -pe 's%^.*/(.+)/'${IMAGE_NAME}'%$1%' )
readonly YYYYMMDD=$( date +%Y%m%d )

echo -e >&2 "[example:option] --pull --no-cache -q\n"

_com="sudo docker build ${args} --build-arg HTTP_PROXY=${_proxy} --build-arg HTTPS_PROXY=${_proxy} --build-arg http_proxy=${_proxy} --build-arg https_proxy=${_proxy} --build-arg repo_name=${REPO_NAME} -t ${REPO_NAME}/${IMAGE_NAME}:${YYYYMMDD} ${DIR}/"
echo -e >&2 "  [run] ${_com}\n"
eval ${_com}
ret=$?

    echo >&2
if [[ ${ret} -eq 0 ]]; then
    echo >&2 "run:"

    sudo docker images ${REPO_NAME}/${IMAGE_NAME}:latest | grep -qv "^REPOSITORY"
  if [[ $? -eq 0 ]]; then
    echo >&2 " sudo docker images | sort | grep --color -E \"${REPO_NAME}/${IMAGE_NAME}|\$\""
    echo >&2 " sudo docker rmi ${REPO_NAME}/${IMAGE_NAME}:latest"
  fi

    image_id=$( sudo docker images ${REPO_NAME}/${IMAGE_NAME}:${YYYYMMDD} | tail -1 | awk '{print $3}' )
    echo >&2 " sudo docker tag ${image_id} ${REPO_NAME}/${IMAGE_NAME}:latest"
    echo >&2 " sudo docker images | sort | grep --color -E \"${REPO_NAME}/${IMAGE_NAME}|\$\""
    echo >&2 " sudo docker push ${REPO_NAME}/${IMAGE_NAME}"
    echo >&2
else
    echo >&2 "err: ${ret}"
fi

exit
