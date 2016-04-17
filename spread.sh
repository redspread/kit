#!/bin/bash

# load commands
for file in ./cmd/*.sh; do
    source $file
done

eval $@
