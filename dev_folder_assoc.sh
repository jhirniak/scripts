#!/usr/bin/env python
import subprocess

mounts = {}

for line in subprocess.check_output(['mount', '-l']).split('\n'):
    parts = line.split(' ')
    if len(parts) > 2:
        mounts[parts[2]] = parts[0]

for k in mounts:
    print mounts[k] + ": " + k
