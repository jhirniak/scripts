#!/bin/bash

# Maps device name to folder in which it is mounted

mount | cut -f 1,3 -d ' '
