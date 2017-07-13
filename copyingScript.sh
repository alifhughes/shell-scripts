#!/bin/bash

# TODO:
# - help argument
# - check format
# - check if all arguments are present

# Get the directoy to copy iterate and copy from
dir_to_copy_from="$1"

# Get the directory to copy to
dir_to_copy_to="$2"

# Get the date to compare against the date accessed
date_to_compare="$3"

# Convert the date passed in to UNIX timestamp
converted_date_to_compare=$(date -j -f "%a %b %d %T %Z %Y" "$date_to_compare" "+%s")

# Iterate the directory passed in
for d in "$dir_to_copy_from"*;
do

    echo -e "\n";

    echo -e "Checking $d ... \n";

    # Get date of folder in UNIX seconds
    date_of_curr_folder_birth="$(stat -f "%B" "$d")"
    date_of_curr_folder_change="$(stat -f "%c" "$d")"

    # Check if current folder creation date is after date passed in or changed date
    if [ ${date_of_curr_folder_birth} -ge ${converted_date_to_compare} -o ${date_of_curr_folder_change} -ge ${converted_date_to_compare} ] ; then

        echo -e "Copying $d and its contents... \n";

        # Is after, copy this folder to destination folder
        cp -pPR -v "$d" "$dir_to_copy_to"

    else

        # Not before skip
        echo -e "Do not copy, skipping... \n";
        continue

    fi

    echo -e "\n";

done;
