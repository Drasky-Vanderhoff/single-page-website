#!/bin/bash
 
type -P compass &>/dev/null  || { echo "Compass command not found."; exit 1; }
type -P coffee &>/dev/null  || { echo "Coffee command not found."; exit 1; }
 
# Get current directory (project path)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
 
SASS_DIR="$DIR/assets/sass/"
CSS_DIR="$DIR/stylesheets/"
CS_DIR="$DIR/assets/coffeescripts/"
JS_DIR="$DIR/javascripts/"
 
if [ ! -d "$SASS_DIR" ] || [ ! -d "$CS_DIR" ]
then
  echo "Project not setup correctly! Put sass files in "$SASS_DIR" and coffee in "$CS_DIR""
else
  if [ ! -d "$CSS_DIR" ]
  then
    mkdir "$CSS_DIR"
  fi
  if [ ! -d "$JS_DIR" ]
  then
    mkdir "$JS_DIR"
  fi
  echo "Watching changes in "$SASS_DIR" and "$CS_DIR" and compiling to "$CSS_DIR" and "$JS_DIR" respectively..."
  `compass watch "$DIR"` &
  `coffee -o "$JS_DIR" -cwl "$CS_DIR"` &
  wait
fi