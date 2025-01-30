#!/bin/bash
# Responding to user input with a case statement

read -p "Enter a fruit (apple/banana/orange): " fruit

case $fruit in
  apple)
    echo "You chose an apple." ;;
  banana)
    echo "You chose a banana." ;;
  orange)
    echo "You chose an orange." ;;
  *)
    echo "Unknown fruit." ;;
esac
