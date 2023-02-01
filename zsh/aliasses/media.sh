#!/usr/bin/env bash

webm2mp3() {
	FILE=$1
	ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3"
}

alias ytmp3="yt-dlp -f 'ba' -x --audio-format mp3 --add-metadata --embed-thumbnail"
alias ytdl="yt-dlp -f 'bv+ba' -x  --add-metadata --embed-thumbnail"
