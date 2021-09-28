#!/usr/bin/env bash
set -x
source /etc/birdnet/birdnet.conf

if pgrep arecord &> /dev/null ;then
  echo "Recording"
else
  if [ -z ${REC_CARD} ];then
    arecord -f S16_LE -c${CHANNELS} -r48000 -t wav --max-file-time 10\
      --use-strftime ${RECS_DIR}/%B-%Y/%d-%A/%F-birdnet-%I:%M:%S%P.wav
  else
    arecord -f S16_LE -c${CHANNELS} -r48000 -t wav --max-file-time 10\
     -D "${REC_CARD}" --use-strftime \
     ${RECS_DIR}/%B-%Y/%d-%A/%F-birdnet-%I:%M:%S%P.wav
  fi
fi
