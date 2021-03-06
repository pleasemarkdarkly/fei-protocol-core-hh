#!/usr/bin/env bash

FEI_PROTOCOL="./fei-protocol.pdf"
PDFTOTEXT="$(which pdftotext)"
FFMPEG="$(which ffmpeg)"
SAY="$(which say)"

declare -a pre_reqs=(
  "${FEI_PROTOCOL}"
  "${PDFTOTEXT}"
  "${FFMPEG}"
  "${SAY}"
  )

function matches_exist () {
 [ $# -gt 1 ] || [ -e "$1" ]
}

function convert() {
 ${PDFTOTEXT} ${FEI_PROTOCOL} temp.txt
 cat "./temp.txt" | "${SAY}" --progress -v "Samantha Compact" --rate=250 -o "./temp.aiff"
 "${FFMPEG}" -i "./temp.aiff" -f mp3 -acodec libmp3lame -ab 320000 -ar 44100 "${FEI_PROTOCOL}.mp3"
 rm "./temp.aiff" && rm "./temp.txt"
}

function main() {
 for i in "${pre_reqs[@]}"
 do 
   if matches_exist "$i"; then
     echo "$i present, continuing"
     else 
       echo "$i could not be found, exiting" 
   fi
 done 
}

main && convert
