FROM alpine:3.7

RUN apk add --no-cache ca-certificates wget

ENV PYPY_VERSION=pypy2-v5.9.0-linux64
ENV MOUNTPOINT=/tmp/core_volume

RUN cd /tmp \
  && wget https://bitbucket.org/pypy/pypy/downloads/${PYPY_VERSION}.tar.bz2 \
  && tar -xjf ${PYPY_VERSION}.tar.bz2 \
  && rm ${PYPY_VERSION}.tar.bz2

COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["run"]
