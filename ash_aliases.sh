# Copyright (c) Robert LaRocca, http://www.laroccx.com

# Helpful aliases for busybox sysadmins, developers and the forgetful.

# Script version and release
script_version='4.0.0'
script_release='devel'  # options devel, beta, release, stable
export ASH_ALIASES_VERSION="$script_version-$script_release"

PATH="$PATH:/usr/local/sbin:/usr/local/bin"

# Purge the current shell session history after removing
# files using the clean command.
clean() {
	# Unfortunately using the which command wont work here.
	# Must use the absolute path to clean script.
	/usr/local/bin/clean "$@"
	if [[ "$SHELL" == "/bin/ash" ]]; then
		echo "WARN: Cannot purge ash (busybox) history buffer." 2>&1
		# history -c || history -p
	elif [[ "$SHELL" == "/bin/bash" ]]; then
		history -c
	elif [[ "$SHELL" == "/bin/zsh" ]]; then
		history -p
	fi
}

alias swupdate="$(which swupdate) --opkg"
