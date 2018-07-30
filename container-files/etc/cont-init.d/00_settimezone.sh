#!/usr/bin/with-contenv sh

set -e

#User params
TZ=${TZ:="UTC"}

TZFILE="../usr/share/zoneinfo/${TZ}"

# Work from the /etc directory
cd /etc

if [ -f ${TZFILE} ]; then  # Make sure the file exists
	echo "Setting timezone to ${TZ}"
	ln -sf ${TZFILE} localtime  # Set the timezone
else
	echo "Timezone: ${TZ} not found, skipping"
fi
