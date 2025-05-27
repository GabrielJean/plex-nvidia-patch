FROM linuxserver/plex:1.41.7
# Install curl for script downloads
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
# Download patch.sh and docker-entrypoint.sh from GitHub (update URLs if needed)
RUN curl -sSL https://raw.githubusercontent.com/keylase/nvidia-patch/refs/heads/master/patch.sh -o /usr/local/bin/patch.sh && \
    curl -sSL https://raw.githubusercontent.com/keylase/nvidia-patch/refs/heads/master/docker-entrypoint.sh -o /docker-entrypoint.sh && \
    chmod +x /usr/local/bin/patch.sh /docker-entrypoint.sh
RUN echo "exec /init" >> /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []