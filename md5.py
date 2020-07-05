import hashlib   
import glob
import os
import io
import sys
 
def printUsage():
	print ('''Usage: [python] pymd5sum.py ''')

def geneMd5(filename):
    m = hashlib.md5()
    file = io.FileIO(filename,'r')
    bytes = file.read(1024)
    while(bytes != b''):
        m.update(bytes)
        bytes = file.read(1024) 
    file.close()
    return m.hexdigest()

def main():
    # if(len(sys.argv) != 1 and len(sys.argv) != 2):
    #     printUsage()
    # mat = "{:48}\t{:32}"
    # if(len(sys.argv)==1):
    #     path="./"
    # if(len(sys.argv)==2):
    #     path=sys.argv[1]
    # for fpathe,dirs,fs in os.walk(path):
    #     for f in fs:
    #         full_file = os.path.join(fpathe,f)
    #         print (mat.format(full_file,geneMd5(full_file)))
    path = '/Users/zexi/Downloads'
    flac_list = glob.glob(os.path.join(path, '*.flac'))

    md5_set = set()

    for full_file in flac_list:
        md5value = geneMd5(full_file)
        if md5value not in md5_set:
            md5_set.add(md5value)
        else:
            print(full_file)

main()
