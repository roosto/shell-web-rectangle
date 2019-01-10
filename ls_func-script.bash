#!/bin/bash

/bin/ls "$@"

cd $1
echo CWD: $(pwd)
