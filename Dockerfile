#############################################
# -------------------------------------------
# Creating BASE image
# -------------------------------------------
#############################################

FROM centos:7 AS base
MAINTAINER pavlobornia

COPY assets /assets
RUN chmod -R 755 /assets && \
    bash /assets/setup.sh


#############################################
# -------------------------------------------
# Start new stage for installing the database
# -------------------------------------------
#############################################

FROM base AS builder
COPY install_folder /install
RUN /assets/install.sh && rm -rf /install

#############################################
# -------------------------------------------
# Start new layer for database runtime
# -------------------------------------------
#############################################

FROM base AS runtime
COPY --chown=oracle:oinstall --from=builder /opt/oracle /opt/oracle

RUN /assets/create_db.sh
EXPOSE 1521

CMD ["/assets/entrypoint.sh"]
