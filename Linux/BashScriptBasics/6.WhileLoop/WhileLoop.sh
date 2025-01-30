#!/bin/bash
# Printing numbers from 1 to 5 using a while loop

count=1
while [ $count -le 5 ]; do
  echo "Count: $count"
  ((count++))
done
