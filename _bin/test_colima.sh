#!/bin/bash

colima status 2>&1 | head -n 1 | grep -q 'colima is running' &> /dev/null
if [ $? == 0 ]; then
  exit 0
fi
exit 1

