FROM sinusbot/docker

RUN apt-get update && apt-get install python

RUN YOUTUBE_DL_DIR='/opt/sinusbot/youtube-dl' \
    mkdir "${YOUTUBE_DL_DIR}" \
    && cd "${YOUTUBE_DL_DIR}" \
    && curl -L -O https://yt-dl.org/downloads/latest/youtube-dl \
    && chmod a+rx youtube-dl \
    && chown $(id -u) youtube-dl

RUN printf "#!/bin/sh\n/opt/sinusbot/youtube-dl/youtube-dl -U --restrict-filename >/dev/null" > /etc/cron.daily/ytdl
