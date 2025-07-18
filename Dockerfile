FROM debian:bullseye

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    crispy-doom xvfb x11vnc fluxbox wget python3 unzip x11-utils \
    libgl1-mesa-dri libgl1-mesa-glx libglu1-mesa && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install noVNC and websockify
RUN mkdir -p /opt/novnc/utils/websockify && \
    wget -qO- https://github.com/novnc/noVNC/archive/master.tar.gz | tar -xz --strip-components=1 -C /opt/novnc && \
    wget -qO- https://github.com/novnc/websockify/archive/master.tar.gz | tar -xz --strip-components=1 -C /opt/novnc/utils/websockify

# Copy assets
COPY DOOM.WAD /root/DOOM.WAD
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
