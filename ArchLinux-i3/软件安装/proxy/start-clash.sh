#!/bin/bash

# save pid file
echo $$ > ${HOME}/.config/clash/clash.pid


diff ${HOME}/.config/clash/config.yaml <(curl -s ${CLASH_URL})

if [ "$?" == 0 ]
then
	# If they are the same
	/usr/bin/clash
else
	# To store the current configuration file for safety
	cp ${HOME}/.config/clash/config.yaml "${HOME}/.config/clash/config.yaml.back"
	# To download the file
	curl -L -o ${HOME}/.config/clash/config.yaml ${CLASH_URL}
	# To exec clash
	/usr/bin/clash
fi
