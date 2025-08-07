FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgirepository1.0-dev \
    libcairo2-dev \
    gir1.2-gstreamer-1.0 \
    python3-gi \
    python3-gi-cairo \
    mpv \
    ffmpeg \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mopidy mopidy-iris mopidy-youtube yt-dlp

COPY mopidy.conf /etc/mopidy/mopidy.conf

EXPOSE 6680

CMD ["mopidy", "--config", "/etc/mopidy/mopidy.conf"]
