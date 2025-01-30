#!/bin/bash
# Checking if a number is positive, negative, or zero

num=-5

if [ $num -gt 0 ]; then
  echo "Number is positive."
elif [ $num -lt 0 ]; then
  echo "Number is negative."
else
  echo "Number is zero."
fi
