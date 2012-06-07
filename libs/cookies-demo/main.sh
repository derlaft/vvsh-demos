#!/bin/bash

if [ -n "${http_params[name]}" ]; then
  
  add_cookie "${http_params[name]}" "${http_params[value]}"
  redirect 'index.wsh'
  exit
fi

header
