FROM eeacms/zope:2.13.22
MAINTAINER "European Environment Agency (EEA): IDM2 S-Team" <eea-edw-s-team-alerts@googlegroups.com>

ENV EVENT_LOG_LEVEL=INFO \
    Z2_LOG_LEVEL=INFO \
    ZSERVER_THREADS=4 \
    BLOB_CACHE_SIZE=50000 \
    SETUPTOOLS=28.6.0 \
    ZCBUILDOUT=2.5.3

COPY src/versions.cfg src/base.cfg $ZOPE_HOME/

RUN mkdir -p $ZOPE_HOME/products

RUN svn co https://svn.eionet.europa.eu/repositories/Zope/bundles/Eionet-Art17/trunk products

USER root
RUN ./install.sh && chown -R 500:500 $ZOPE_HOME

USER zope-www
