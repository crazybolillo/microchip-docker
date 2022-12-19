#!/usr/bin/env bash

set -e

if [[ ! -d /opt/microchip/xc8 ]]; then
	echo "Installing XC8 compiler"
	${XC8_RUN} --mode unattended --netservername crap;
	ln -s $(dirname $(find /opt/microchip/ -name "xc8-cc"))/* /usr/local/bin;
fi

if [[ -v REPO_URL ]]; then
	if [[ ! -d ${REPO_DIR} ]]; then
		echo "Initializing git repository"
		git clone ${REPO_URL} ${REPO_BRANCH:+ -b ${REPO_BRANCH}} --depth=1 ${REPO_DIR}
		cd ${REPO_DIR}
		git config pull.ff only
	else
		echo "Updating git repository"
		cd ${REPO_DIR}
		git pull
	fi
fi


if [[ "${1}" == "build-check.sh" ]]; then
	shift
	exec /usr/local/bin/build-check.sh ${@}
else
	exec ${@}
fi
