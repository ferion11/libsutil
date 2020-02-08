#!/usr/bin/env python

import urllib, urllib.request, glob, codecs, re, os, sys
import xml.etree.ElementTree as ET
#======================================================================

def check_downloaded_file(link,file_name):
    req = urllib.request.Request(
        link,
        data = None, 
        headers = {
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36'
        }
    )
    resp = urllib.request.urlopen(req)
    
    meta = resp.info()
    remote_length_s = meta.get(name="Content-Length")
    remote_length = int(remote_length_s)
    
    f = open(file_name, "rb")
    local_length = len(f.read())
    f.close()
    
    if (remote_length ==  local_length):
        print ("* Download Full: %s\n" %file_name)
    else:
        print ("* Download Incomplete: %s" %file_name)
        print (" - File on disk: %d" %local_length)
        print (" - Remote Content-Length: %d\n" %remote_length)

def check_local_file(file_name, length):
    f = open(file_name, "rb")
    local_length = len(f.read())
    f.close()
    
    if (length ==  local_length):
        print ("* File is Full: %s\n" %file_name)
    else:
        print ("* File is Incomplete: %s" %file_name)
        print (" - File on disk: %d" %local_length)
        print (" - Length should be: %d\n" %length)
#======================================================================

link = 'https://cdn.simplecast.com/audio/695767/695767b0-cd40-4e6c-ac8c-ac6bc0df77ee/c235bd55-09a5-4c66-9dfa-937bbd3fd151/trees-e4-final_tc.mp3?&amp;aid=rss_feed'
file_name="2020.01.27.Dismantling_the_Tree_Tree_of_Life_E4.mp3"

#check_downloaded_file(link, file_name)
#======================================================================

tree = ET.parse('/tmp/the_naked_bible.xml')
root = tree.getroot()
channel = root.find('channel')
#ctitle = channel.find('title').text

quantidade = 0
for item in channel.findall('item'):
    enclosure = item.find('enclosure')
    url = enclosure.get('url')
    #print("URL %s" %url)
    length_s = enclosure.get('length')
    length = int(length_s)
    #print("URL length %d" %length)
    ptitle = item.find('title').text
    quantidade = quantidade +1
    title = ptitle.strip()
    title = re.sub('[^A-Za-z0-9]','_',title)
    title = re.sub('_+','_',title)
    # solve title too long problem
    title = title[:128]
    #print("Title: %s" %title)
    #dest_tag = os.path.join(podsub,'%s.%s.%s' % (fmtdate,title,suffix))
    for file in os.listdir("/tmp/dir"):
        if title in file:
            cur_filename = os.path.join("/tmp/dir", file)
            check_local_file(cur_filename, length)

print("URL quantidade %d" %quantidade)
#======================================================================

## Using readlines() 
#ever_downloaded_file = open('/tmp/ever_downloaded.txt', 'r') 
#Lines = ever_downloaded_file.readlines() 
#  
#count = 1
## Strips the newline character 
#for line in Lines:
#    current_line = line.strip()
#    #print("Line %d: %s" %(count, current_line))
#    count = count +1
#
#ever_downloaded_file.close()
#======================================================================
