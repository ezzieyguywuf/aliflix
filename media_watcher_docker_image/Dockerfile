# Use Ubuntu as the base image
FROM ubuntu:latest

# Set DEBIAN_FRONTEND to noninteractive to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install lsyncd, rsync, and sudo (sudo might be useful for file permission debugging later if needed, optional)
# lua-posix might be needed by some lsyncd configurations or lua scripts if they use os.getenv("PWD") extensively,
# but for fixed paths like /source and /dest, it's often not strictly required by lsyncd itself.
# For this basic config, lsyncd's bundled/dependency Lua should be sufficient.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        lsyncd \
        rsync \
        sudo \
        lua-posix \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create directory for lsyncd configuration and status file parent directory
RUN mkdir -p /etc/lsyncd && \
    mkdir -p /var/run && \
    mkdir -p /mnt/uploads-from-rsync /mnt/jellyfin-media-library

COPY lsyncd.conf.lua /etc/lsyncd/lsyncd.conf.lua

# Expose source and dest as potential volumes (mainly for documentation)
VOLUME ["/mnt/uploads-from-rsync", "/mnt/jellyfin-media-library"]

CMD ["lsyncd", "-nodaemon", "/etc/lsyncd/lsyncd.conf.lua"]
