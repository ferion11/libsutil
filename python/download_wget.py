#!/usr/bin/env python

import os, sys

url = 'https://cdn.simplecast.com/audio/695767/695767b0-cd40-4e6c-ac8c-ac6bc0df77ee/c235bd55-09a5-4c66-9dfa-937bbd3fd151/trees-e4-final_tc.mp3?&amp;aid=rss_feed'
filename = './algo.mp3'
code = os.system('wget -T 7 -c -O %s %s' %(filename, url))
print('Code: %s' %code)
if code == 0:
    print('Done!!!')
else:
    print('Error!!!')
    sys.exit(1)
print('Done END!!!')
