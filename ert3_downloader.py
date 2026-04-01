import requests
import os
import getpass
import sys

username = getpass.getuser()

if os.path.exists(f"C:\\Users\\{username}\\settings.txt"):
  os.chdir("C:\\Users\\{username}")
  f = with open("settings.txt", "r")
else:
  sys.exit(1)

url = "https://github.com/dnSpy/dnSpy/releases/download/v6.1.8/dnSpy-net-win64.zip"
directory = f.readline()
filename = directory + 'dnSpy-net-win64.zip'
r = requests.get(url)

f = open(filename,'w')
f.write(r.content)
