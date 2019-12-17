#!/bin/bash

if [ ! $(gem query -i -n bundler) ]; then
  echo "Bundler is not installed!"
  exit
fi

bundle exec ruby run.rb