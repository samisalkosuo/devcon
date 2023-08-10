#!/bin/bash

#create output dir
OUTPUT_DIR=converted
mkdir -p $OUTPUT_DIR

script_start=`date +%s`

function convertFile
{
    local file=$1
    local outputFile=$OUTPUT_DIR/$1.mp4
    if [ -f "$outputFile" ]; then
       echo "$outputFile exists."
    else 
        date
        start=`date +%s`
        ffmpeg -i $file $outputFile
        #touch $outputFile
        end=`date +%s`
        date
        echo Elapsed: ~`expr $end - $start` seconds
    fi
    echo ""
}

#rename all mp4 files with spaces, changes space to undescore
for f in *mp4; do mv "$f" `echo $f | tr ' ' '_'`; done

FILES=$(ls -1 *mp4)
FILES=$(echo $FILES | tr '\n' ' ')
for f in $FILES
do
  convertFile $f
done

script_end=`date +%s`
secs=`expr $script_end - $script_start`
printf 'Total elapsed time: %02dh:%02dm:%02ds\n' $((secs/3600)) $((secs%3600/60)) $((secs%60))