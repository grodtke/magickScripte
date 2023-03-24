#!/bin/bash
#
# Developed by Eckhard Grodtke 12/31/2022
#
# ------------------------------------------------------------------------------
# 
# Licensing:
# 
# Copyright © Eckhard Grodtke
# 
# Script is free of charge for non-commercial use, ONLY.
# The scripts is also subject, in a subordinate manner, to the ffmpeg
# license, which can be found at: http://www.imagemagick.org/script/license.php
# 
# ------------------------------------------------------------------------------
# 
########################
#
# USAGE: movie_to_png.sh [-i inputFolder] [-e extension]  [-p path] [-f filename] [-d delay]‚
# DEMO:./movie_to_png.sh -i ./apng_test/IMG_0746.mov -e png -o ./ -f img -d 100
#
# -i     inputFolder           relative path to inputfolder
# -e     extension             extension input 
# -o     outputFolder          relative path to output folder  
# -f     filename              output Filename
# -r     delay First part of filename eg 202212
###
#
# NAME: TURN_RIGHT_AND_CONCAT
# 
# PURPOSE: turn all images in Folder about 90 degrees and concat
# 
# CAVEAT: No guarantee that this script will work on all platforms, 
# nor that trapping of inconsistent parameters is complete and 
# foolproof. Use At Your Own Risk. 
# 
######
#


# test for correct number of arguments and get values
if [ $# -eq 0 ]
	then
	# help information
   echo ""
   usage2
   exit 0
elif [ $# -gt 14 ]
	then
	echo "--- TOO MANY ARGUMENTS ---"
fi

while getopts i:e:o:f:r: flag
do
    case "${flag}" in
        i) inputFile=${OPTARG};;
        e) extension=${OPTARG};;
        o) outputFolder=${OPTARG};;
        f) filename=${OPTARG};;
        r) delay=${OPTARG};;
    esac
done
echo "inputFile: $inputFile";
echo "extension: $extension";
echo "outputFolder: $outputFolder";
echo "filename: $filename";
echo "delay: $delay"

#ffmpeg -i $inputFile -vf fps=1/100 $filename%03d.$extension 
ffmpeg -i $inputFile -vf "select=eq(pict_type\,I)" -vsync vfr $outputFolder$filename-%04d.$extension
exit 0






