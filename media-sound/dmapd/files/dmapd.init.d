#!/sbin/runscript
# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Based on mt-daapd init.d file created for gentoo 
#
# You can run multiple copies of this service just symlinking them to
# forked-daapd.<name>, then it will load /etc/forked-daapd.d/<name>.conf as config
# file.
# Remember to give them different logs and cache directories.
#
# The main instance (with no <name>) uses /etc/forked-daapd.conf

# Check for OpenRC/Baselayout 2 -- see bug #230917
if [ -f /lib/librc.so -o -f /etc/init.d/sysfs -o -f /lib/rc/version ]; then
	myservice=$RC_SVCNAME
fi

PIDFILE="/var/run/dmapd.pid"

depend() {
	need net
	#USEHOWL need mDNSResponderPosix
}

start() {
	ebegin "Starting dmapd server"
	
	IFS=:

	for musicdir in $MUSICDIR
	do
		m = $m . " -m " . $musicdir
	done

	for pictuedir in $PICTURE
	do
		p = $p . " -p " . $picturedir
	done

	start-stop-daemon --start --quiet --pidfile ${PIDFILE} \
		--exec /usr/sbin/dmapd -- \
		--user dmapd \
		--group dmapd \
		--name "$NAME" \
		$m \
		$p \
		--lockpath /var/lock/dmapd

	eend $?
}

stop() {
	ebegin "Stopping dmapd server"
	start-stop-daemon --stop --quiet --pidfile ${PIDFILE} --signal 2
	eend $?

	rm -f ${PIDFILE}
}
