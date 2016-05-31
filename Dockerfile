FROM gliderlabs/alpine:3.3

VOLUME /tmp/core_volume

RUN apk-install ca-certificates wget

ENV PYPY_VERSION=pypy-5.1.1-linux64
RUN cd /tmp && \
  wget https://bitbucket.org/pypy/pypy/downloads/${PYPY_VERSION}.tar.bz2 && \
  tar -xjf ${PYPY_VERSION}.tar.bz2 && \
  rm ${PYPY_VERSION}.tar.bz2

COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["run"]
