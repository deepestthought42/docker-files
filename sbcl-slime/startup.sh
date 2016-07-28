#!/bin/bash

echo "Starting SSH daemon"
service ssh start

echo "Starting SBCL w/ slynk server"
sbcl

