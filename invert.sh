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
# USAGE: invert.sh  [-i inputFolder] [-e extension] date_for_regexcomlete]
# DEMO:./invert.sh -i ./apng_test/ -e png 
#
# -i     inputFolder           relative path to inputfolder
# -e     extension             extension input 
###
#
# NAME: TURN_RIGHT_AND_CONCAT
# 
# PURPOSE: invert colors of all Images in folder
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

while getopts i:e: flag
do
    case "${flag}" in
        i) inputFolder=${OPTARG};;
        e) extension=${OPTARG};;
    esac
done
echo "inputFolder: $inputFolder";
echo "extension: $extension";

mogrify -negate $inputFolder*.$extension
exit 0






