#!/bin/sh
set -e

export GATSBY_DIR="/frontend"
export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run NPM install if needed
if [ ! -f "$GATSBY_DIR/package.json" ]
then
  echo "Initializing Gatsby..."
  gatsby new $GATSBY_DIR

else
  if [ ! -e "$GATSBY_DIR/node_modules/" ]
  then
    echo "Node modules is empty. Running npm install..."
    npm install

  fi

fi

# TODO: Decide what to do based on $environment argument
# if  [ "$environment" == "develop" ]
# then
  rm -rf $GATSBY_DIR/public
  gatsby develop --host 0.0.0.0

# elif  [ "$environment" == "build" ]
# then
#   rm -rf $GATSBY_DIR/public
#   gatsby build
# 
# elif  [ "$environment" == "stage" ]
# then
#   rm -rf $GATSBY_DIR/public
#   gatsby build
#   gatsby serve --port 8000
# 
# else
#   exec $@
# 
# fi