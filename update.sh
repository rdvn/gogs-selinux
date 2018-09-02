#!/bin/sh

echo "Building and Loading Policy"

set -x

semodule -r gogs
make -f /usr/share/selinux/devel/Makefile gogs.pp || exit
/usr/sbin/semodule -i gogs.pp

restorecon -vR /home/gogs/gogs
chcon -R -t gogs_data_t /home/gogs/data
chcon -R -t gogs_home_t /home/gogs/gogs
chcon -R -t gogs_exec_t /home/gogs/gogs/gogs
chcon -R -t gogs_data_t /home/gogs/gogs/data
chcon -R -t gogs_conf_t /home/gogs/gogs/custom
chcon -R -t gogs_log_t  /home/gogs/gogs/log
