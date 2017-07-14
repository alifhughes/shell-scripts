#!/bin/bash

# TODO:
# - help argument
# - check format
# - check if all arguments are present

# Get the directoy to copy iterate and copy from
dir_to_copy_from="$1"

# Get the directory to copy to
dir_to_copy_to="$2"

# Iterate all directories in the folder
#  - check if current directory is empty
#       - if it is copy
#       - if it isn't
#           - loop through subdirectories of current directory
#               - check if current directory is empty
#                  - if it is copy
#                  - if it isn't

# Iterate the directory passed in
for d in "$dir_to_copy_from"*; do

    echo -e "\n";

    echo -e "Checking $d ... \n";

    # Check if folder is not empty
    if [ "$(ls -A "$d")" ] ; then

            echo -e "$d is not empty, checking its contents... \n";

            ls -A "$d"

            # Iterate sub directories of d
            for subd in "$d"/*; do

                ls -A "$subd"

                # Check if folder is not empty
                if [ "$(ls -A "$subd")" ] ; then

                    # Not empty, skip
                    echo -e "$subd is not empty, do not copy... \n";

                else

                    # Subdirectory is empty, copy the whole directory over
                    cp -a -v "$d" "$dir_to_copy_to"

                fi

            done;

            # Not empty, skip
            echo -e "Not empty, do not copy... \n";

            continue;

        else

            # Subdirectory is empty, copy the whole directory over
            cp -a -v "$d" "$dir_to_copy_to"


    fi

    echo -e "\n";

done;
