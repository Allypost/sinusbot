FROM sinusbot/docker

RUN apt-get update && apt-get install python

RUN mkdir "/opt/sinusbot/youtube-dl" \
    && cd "/opt/sinusbot/youtube-dl" \
    && curl -L -O https://yt-dl.org/downloads/latest/youtube-dl \
    && chmod a+rx youtube-dl \
    && chown $(id -u) youtube-dl

RUN printf "#!/bin/sh\n/opt/sinusbot/youtube-dl/youtube-dl -U --restrict-filename >/dev/null" > /etc/cron.daily/ytdl
