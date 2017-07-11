#!/bin/bash

# Get the directoy to copy iterate and copy from
dir_to_copy_from="$1"

# Get the directory to copy to
dir_to_copy_to="$2"

# Get the date to compare against the date accessed
date_to_compare="$3"

# Check formatting of directories
# TODO

# Convert the date passed in to UNIX timestamp
converted_date_to_compare=$(date -j -f "%a %b %d %T %Z %Y" "$date_to_compare" "+%s")

# Iterate the directory passed in
for d in $dir_to_copy_from;
do

    echo -e "\n";

    echo -e "Checking $d ... \n";

    # Get date of folder in UNIX seconds
    date_of_curr_folder=$(stat -f "%B" "$d")

    # Check if current folder creation date is after date passed in
    if [ ${date_of_curr_folder} -ge ${converted_date_to_compare} ] ; then

        echo -e "Copying $d and its contents... \n";

        # Is after, copy this folder to destination folder
        cp -pPR -v $d $dir_to_copy_to

    else

        # Not before skip
        echo -e "Do not copy, skipping... \n";

    fi

    echo -e "\n";

done;
