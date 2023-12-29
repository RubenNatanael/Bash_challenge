#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2

# TODO: Implement the recursive search logic here
function search
{
  local current_dir=$1

  for file in "$current_dir"/*; do
      if [ -d $file ]; then
        search "$file";
      elif [ -f $file ] && [ "$(basename "$file")" = $target_file ]; then
        echo "File path: $file"
        exit 0;
      fi
  done
}
if [ ! -d "$search_directory" ]; then
  echo "Error: Directory '$search_directory' not found."
  exit 1
fi

search "$search_directory"

echo "File not found: $target_file"
exit 1
