#!/bin/dash

mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --vf=hflip >/dev/null 2>&1 &
