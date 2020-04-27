from ftplib import FTP 
import os
import fileinput

ftp = FTP()
ftp.set_debuglevel(2)
ftp.connect('crmissile.hopto.org', 21) 
ftp.login('logger','logger')

ftp.cwd('/')


import time
while True:
    
  time.sleep(15) # Delay for 1 minute (60 seconds).

  def ftp_upload(localfile, remotefile):
    fp = open(localfile, 'rb')
    ftp.storbinary('STOR %s' % os.path.basename(localfile), fp, 1024)
    fp.close()
    print ("after upload " + localfile + " to " + remotefile)
 
 
  localdir = ".\\tmp"
 
  def upload_img(file):
    ftp_upload(localdir + "\\" + file, file)
 
  lastlist = []
 
  for line in fileinput.input(localdir + "\\list.txt"):
      lastlist.append(line.rstrip("\n"))
 
  currentlist = os.listdir(localdir)
 
  newfiles = list(set(currentlist))
 
  if len(newfiles) == 0:
    print ("No files need to upload")
  else:
    for needupload in newfiles:
      print ("uploading " + localdir + "\\" + needupload)
      upload_img(needupload)
      with open(localdir + "\\list.txt", "a") as myfile:
        myfile.write(needupload + "\n")

ftp.quit()
