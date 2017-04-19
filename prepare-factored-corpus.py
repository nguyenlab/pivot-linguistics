import sys


inFileName=sys.argv[1]
outFileName=sys.argv[2]


inFile=open(inFileName,'r')
outFile=open(outFileName,'w')

sent=''
for line in inFile:
	st=line.split("	")
	if len(st)>3:
		tupe=("%s|%s|%s" %(st[1],st[2],st[3]))
		sent=' '.join([sent,tupe])
	else:
		outFile.write("%s\n"%(sent.strip()))
		sent=''

inFile.close()
outFile.close()