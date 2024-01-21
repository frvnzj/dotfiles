#!/bin/sh

ffmpeg -y -f alsa -i default -acodec pcm_s16le -ac 1 -ar 44100 -t 4 -f wav ~/.cache/audio.wav >/dev/null 2>&1

vosk-transcriber -m ~/.local/share/kdenlive/speechmodels/vosk-model-small-es-0.42 -i ~/.cache/audio.wav -o ~/.cache/audio.txt >/dev/null 2>&1

cat ~/.cache/audio.txt
