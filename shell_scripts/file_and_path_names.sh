#!/bin/bash
for fullpath in "$@"
do
    filename="${fullpath##*/}"                      # Strip longest match of */ from start
    dir="${fullpath:0:${#fullpath} - ${#filename}}" # Substring from 0 thru pos of filename
	dir2="${fullpath%$filename}"                    # Substring from 0 thru pos of filename
    base="${filename%.[^.]*}"                       # Strip shortest match of . plus at least one non-dot char from end
    ext="${filename:${#base} + 1}"                  # Substring from len of base thru end
    if [[ -z "$base" && -n "$ext" ]]; then          # If we have an extension and no base, it's really the base
        base=".$ext"
        ext=""
    fi

    echo -e "$fullpath:\n\tdir  = \"$dir\"\n\tdir2  = \"$dir2\"\n\tbase = \"$base\"\n\text  = \"$ext\""
done

# I haven't tested it extensively but I could get the extension with ext="${filename##?(.)+([^.])?(.)}" and the name without extension then with raw_name="${filename:0:${#filename} - ${#ext}}" like this you at least won't need the conditional afterwards. It at least works for files without extension, multiple extensions like tar.gz and also files starting with a dot. – satanik Aug 15 '19 at 20:04 
