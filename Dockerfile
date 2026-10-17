FROM n8nio/n8n:latest

# Switch to root user to install system binaries
USER root

# Install FFmpeg and font packages using Debian's apt-get
RUN apt-get update && apt-get install -y \
    ffmpeg \
    fontconfig \
    fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the standard n8n user
USER node
