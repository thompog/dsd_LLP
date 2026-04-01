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

url = "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/main.py"
directory = f.readline()
filename = directory + 'main.py'
r = requests.get(url)

f = open(filename,'w')
f.write(r.content)
