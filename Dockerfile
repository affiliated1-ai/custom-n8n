FROM n8nio/n8n:latest

# Switch to root user to download binaries
USER root

# Download and install static FFmpeg binary directly (no apt-get or apk required)
RUN curl -L https://www.ffmpeg.org/releases/ffmpeg-release-tarball.tar.xz -o /tmp/ffmpeg.tar.xz || \
    curl -L https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz -o /tmp/ffmpeg.tar.xz && \
    tar -xf /tmp/ffmpeg.tar.xz -C /tmp/ && \
    mv /tmp/ffmpeg-*-static/ffmpeg /usr/local/bin/ffmpeg && \
    mv /tmp/ffmpeg-*-static/ffprobe /usr/local/bin/ffprobe && \
    chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe && \
    rm -rf /tmp/ffmpeg*

# Install fontconfig and fonts if needed
RUN apk add --no-cache fontconfig ttf-dejavu || true

# Switch back to the standard n8n user
USER node
