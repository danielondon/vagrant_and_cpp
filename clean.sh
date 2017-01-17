#!/bin/bash
FILE="cpp-crossplatform/conanbuildinfo.cmake"
if [ -f $FILE ]; then
  echo "Removing $FILE"
  rm $FILE
fi

FILE="cpp-crossplatform/conaninfo.txt"
if [ -f $FILE ]; then
  echo "Removing $FILE"
  rm $FILE
fi

DIRECTORY="cpp-crossplatform/build"
if [ -d $DIRECTORY ]; then
  echo "Removing $DIRECTORY"
  rm -r $DIRECTORY
fi