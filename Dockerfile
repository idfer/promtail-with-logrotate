# syntax=docker/dockerfile:1

FROM grafana/promtail:2.5.0

RUN apt-get update && apt-get install -y \
  cron \
  dumb-init \
  logrotate \
  procps \
  && rm -rf /var/lib/apt/lists/* \
  && chmod u+s /usr/sbin/cron
RUN groupadd --gid 1000 promtail && \
    adduser --uid 1000 --system --ingroup promtail promtail
USER promtail
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["-config.file=/etc/promtail/config.yml"]
