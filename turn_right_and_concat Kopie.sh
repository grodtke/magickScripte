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
# USAGE: turn_right_and_concat.sh  [-i inputFolder] [-e extension]  [-p path] [-f filename] [-r date_for_regexcomlete]
# DEMO: ./turn_right_and_concat.sh -i ./STUTTGART/ e- jpg -o ./ -f jahreswechsel_stuttgart.png -r 202212
#
# -i     inputFolder           relative path to inputfolder
# -e     extension             extension input 
# -o     outputFolder          relative path to output folder  
# -f     filename              output Filename
# -r     date_for_regexcomlete First part of filename eg 202212
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
elif [ $# -gt 7 ]
	then
	echo "--- TOO MANY ARGUMENTS ---"
fi

while getopts i:e:o:f:r: flag
do
    case "${flag}" in
        i) inputFolder=${OPTARG};;
        e) extension=${OPTARG};;
        o) outputFolder=${OPTARG};;
        f) filename=${OPTARG};;
        r) date_for_regexcomlete=${OPTARG};;
    esac
done
echo "inputFolder: $inputFolder";
echo "extension: $extension";
echo "outputFolder: $outputFolder";
echo "filename: $filename";
echo "date_for_regexcomlete: $date_for_regexcomlete"

#magick ../STUTTGART/2022*.jpg +append  null: -background none -rotate 90 \ $filename
magick montage null: $inputFolder$date_for_regexcomlete*.$extension null: -background none -rotate 90 -background white -tile x1 -geometry +0+0  $outputFolder$filename

exit 0






