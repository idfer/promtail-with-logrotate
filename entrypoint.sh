#!/usr/bin/dumb-init /bin/bash

/usr/sbin/cron

exec /usr/bin/promtail $@
