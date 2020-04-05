#!/usr/bin/env python

from urllib.request import urlopen

link =  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.tar.xz"
site = urlopen(link)
meta = site.info()
file_size = int(meta.get("Content-Length", "1").strip())
print("=== All info ===")
print(meta)
print("=== file_size only ===")
print(file_size)
