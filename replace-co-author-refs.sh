#!/bin/bash

# Read the commit message
commit_message_file=$1
commit_message=$(cat "$commit_message_file")

# Path to the file containing the mappings from name to email addresse
source ./co-authos.env

# regex to match [[name]]
pattern="\[\[(\S+?)\]\]"

# Replace [[name]] with "Co-authored-by: ..."
while [[ $commit_message =~ $pattern ]]; do
    match=${BASH_REMATCH[1]}
    if [ -n "${!match}" ]; then
        replacement="Co-authored-by: ${!match}"
        commit_message="${commit_message//\[\[${match}\]\]/$replacement}"
    else
        echo "Email not found for $match"
        exit 1
    fi
done

# Update the commit message file with the modified message
echo "$commit_message" > "$commit_message_file"
