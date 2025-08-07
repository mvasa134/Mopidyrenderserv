FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    mpv \
    ffmpeg \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mopidy mopidy-iris mopidy-youtube yt-dlp

COPY mopidy.conf /etc/mopidy/mopidy.conf

EXPOSE 6680

CMD ["mopidy", "--config", "/etc/mopidy/mopidy.conf"]
