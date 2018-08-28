#!/bin/bash

for ((i = 0; i<$1; i++ ))
do
  go run ./go-client/main.go;
done
