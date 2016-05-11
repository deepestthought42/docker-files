#!/bin/bash

echo "Starting SSH daemon"
service ssh start

echo "Starting SBCL w/ slynk server"
/usr/local/bin/sbcl --eval "(format t \"Started\")"

