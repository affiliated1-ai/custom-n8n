FROM n8nio/n8n:latest

# Switch to root to install system packages
USER root

# Install ffmpeg, fontconfig, and ttf-dejavu using Alpine's package manager
RUN apk update && apk add --no-cache \
    ffmpeg \
    fontconfig \
    ttf-dejavu

# Switch back to n8n user
USER node
