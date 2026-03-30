#!/bin/bash

echo "===== BASIC SCRIPT ====="

name="Tirth"
echo "User: $name"

read -p "Enter number: " num

if [ $num -gt 10 ]; then
  echo "Greater than 10"
else
  echo "Less or equal to 10"
fi

for i in 1 2 3
do
  echo "Loop $i"
done