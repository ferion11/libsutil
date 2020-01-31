#!/usr/bin/env python

#from tqdm import tqdm
from download import download

url = 'https://cdn.simplecast.com/audio/695767/695767b0-cd40-4e6c-ac8c-ac6bc0df77ee/c235bd55-09a5-4c66-9dfa-937bbd3fd151/trees-e4-final_tc.mp3?&amp;aid=rss_feed'
file_path='saida/algo.mp3'
path = download(url, file_path, progressbar=True)
