FROM n8nio/n8n:latest

# Switch to root to install FFmpeg
USER root
RUN apk add --no-cache ffmpeg fontconfig font-dejavu

# Switch back to node user for execution security
USER node
