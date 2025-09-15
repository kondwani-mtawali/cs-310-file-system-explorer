# Kondwani Mtawali
# 09/14/2025
# Outputting file information for a given directory on one line: directory, type, size, MIME type 

list=* # * provides all files in current directory

for file in ${list}; 
    do # '$' points to the value of the given variable
    directory=$(realpath "$file") # Obtaining file directory, realpath obtains full path including item

    if [ -d "$file" ]; 
    then # -d checks if file exists or if it's a directory(-f & -d respectively)
    fileType="dir"
    else [ -f "$file" ]; 
    fileType="file"

    fi # 'fi' finishes if/then/else statement

    fileSize=$(du -h "$file" | cut -f1) # Obtains file size(du = disk usage), -h provides it in a readable format
                                        # cut -f1 specifies to isolate the first section of info from du

    mType=$(file --mime-type -b "$file") # Obtains MIME file type

    echo -e "$directory\t[$fileType]\t$fileSize\t$mType" # -e communicates to echoe to treat \t as a special character, not text to print

done