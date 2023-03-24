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
# The scripts is also subject, in a subordinate manner, to the ImageMagick 
# license, which can be found at: http://www.imagemagick.org/script/license.php
# 
# ------------------------------------------------------------------------------
# 
########################
#
# USAGE: create_apng_from_sorteted_imagefolder [-i inputFolder] [-e extension]  [-p path] [-f filename] [-d delay]
# DEMO:./create_apng_from_sorteted_imagefolder -i ./apng_test/ -o ./ -f himmel_cam.png -d 10
#
# -i     inputFile             relative path and name 
# -o     outputFolder          relative path to output folder  
# -f     filename              output Filename
# -d     delay                 time between animated imp in centisecs
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

while getopts i:o:f:d: flag
do
    case "${flag}" in
        i) inputFile=${OPTARG};;
        o) outputFolder=${OPTARG};;
        f) filename=${OPTARG};;
        d) delay=${OPTARG};;
    esac
done
echo "inputFile: $inputFile";
echo "outputFolder: $outputFolder";
echo "filename: $filename";
echo "delay: $delay"

echo "input: $inputFile*.png" 

magick -delay $delay -loop 0 $inputFile*.png APNG:$outputFolder$filename.png

exit 0






