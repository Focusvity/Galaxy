#!/bin/bash

if [ ! -f "Gemfile" ]; then
  echo "Missing Gemfile, cancelling install"
  exit
fi

if [ ! $(gem query -i -n bundler) ]; then
  echo "Bundler is not installed!"
  exit
fi

bundle install
