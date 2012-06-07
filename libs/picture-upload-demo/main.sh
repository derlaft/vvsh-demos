#!/bin/bash

#set base url
BASE='http://derlaft.ttyh.ru'

#set up uploads dir
target_dir="picture-upload-demo/uploads"

#check if file is uploaded
if [ -n "${http_params[photo]}" ] && [ -n "${http_files[photo]}" ] && 
  echo "${http_params[photo]}" | grep -qi '.\(jpeg\|jpg\|png\|gif\)$'; then

    target_name=$(ls -l "$APPS/$target_dir" | wc -l)

    ext=$(echo "${http_params[photo]}" | sed -e 's/.*\.\([a-zA-Z]\+\)/\1/')

    newname="$target_name.$RANDOM.$ext"
    cp "${http_files[photo]}" "$APPS/$target_dir/$newname"
    chmod 755 "$APPS/$target_dir/$newname"
    uploaded_url="$BASE/$target_dir/$newname"
elif [ -n "${http_params[upload]}" ]; then
  ERRORS='Upload failed'
fi

header
