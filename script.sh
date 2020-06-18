#!/usr/bash
for name in ssc *;
  do 
    # if $name is a directory
    if [ -d "$name" ]; then
      echo "$name"
      cd "$name"
      echo "entered - showing inside $name"
      ls
      mv WEB\ BASED\ RESULT\ PUBLICATION\ SYSTEM\ FOR\ EDUCATION\ BOARDS.html "$name".html
      echo "rename successfull"
      mv "$name".html ../renamed
      echo "moved into renamed"
      cd ..
    fi
  done;