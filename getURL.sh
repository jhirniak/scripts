#!/usr/bin/python

# Extracts specified information from the webpage source.
# Useful for extracting URL to download the newest software package.

# Parameters:
# 1 - URL
# 2 - node type (e.g. a, p, div)
# 3 - attributes describing node (class, id, etc.)
# 4 - attribute content to fetch (e.g. href)
# 5 - return first or all elements

# Returns:
# 

import json, requests, sys
from bs4 import BeautifulSoup

url = sys.argv[1]
node_type = sys.argv[2]
attr = sys.argv[3]
params = json.loads(sys.argv[4])
all = False
if len(sys.argv) == 6:
  all = True

content = requests.get(url).content
soup = BeautifulSoup(content)

nodes = soup.find_all(node_type, params)

if all:
  if attr:
    res = [n[attr] for n in nodes]
  else:
    res = nodes
else:
  res = nodes[0][attr]

print res
