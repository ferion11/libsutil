#!/bin/bash

for file in *.mp3
do
  mv "$file" "$file".part
done
