FROM alpine:3.8

RUN apk add --no-cache ca-certificates wget

ENV PYPY_VERSION=pypy-6.0.0-linux_x86_64-portable
ENV MOUNTPOINT=/tmp/core_volume

RUN cd /tmp \
  && wget https://bitbucket.org/squeaky/portable-pypy/downloads/${PYPY_VERSION}.tar.bz2 \
  && tar -xjf ${PYPY_VERSION}.tar.bz2 \
  && rm ${PYPY_VERSION}.tar.bz2

COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["run"]
