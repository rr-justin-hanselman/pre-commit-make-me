#!/bin/sh
# Simple command that will proxy your make commands for you
echo "Testing that make $@ does not change files"
make $@