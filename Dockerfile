FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Install ffmpeg, fontconfig, and required fonts
RUN apt-get update && apt-get install -y \
    ffmpeg \
    fontconfig \
    font-dejavu \
    && rm -rf /var/lib/apt/lists/*

# Switch back to n8n user
USER node
