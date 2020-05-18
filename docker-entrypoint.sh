#!/bin/bash

chef-client -z -o ${COOKBOOKS} --chef-license accept

if [[ "${DRY}" == "1" ]]; then
  exit 0
else
  exec $@
fi
