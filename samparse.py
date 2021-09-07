#!/usr/bin/env python

import argparse

def getArgs():
	parser = argparse.ArgumentParser()
	parser.add_argument(
		"-f", help="input filename", type=str, required=True
	)
	parser.add_argument(
		"-o", help="output filename", type=str, required=True
	)
	return parser.parse_args()

args = getArgs()
f = args.f
o=args.o

# initializing a variable to hold the count of mapped reads present
mapped_count = 0
# initializing a variable to hold the count of unmapped reads present
unmapped_count = 0
# initializing a set that will hold the first section of the header line, to capture unique reads and not all reads
read_set = set()
with open(f, 'r') as sam: 
	for line in sam:
		line = line.strip()
		if line[0] != '@':
		# ignores header lines in SAM file, allowing all operations below to take place on only read lines
			line_bits = line.split('\t')
			if line_bits[0] not in read_set:
			# screens for unique reads, judged by QNAME

				# initializing variable 'mapped' as false, for use later in the code
				mapped = False
				flag = int(line_bits[1])		# capturing the flag as a separate variable, to be used in if statement below
				if ((flag & 256) != 256):
				# if the flag in the sam file is 4 (denoting an unmapped read), this statement excludes the read line 
					if ((flag & 4 != 4)):
						mapped = True
					if mapped:
						mapped_count+=1
					else:
						unmapped_count+=1
				read_set.add(line_bits[0])

total = mapped_count + unmapped_count

with open(o, 'w') as out:
	out.write('mapped:' + str(mapped_count) + '\n')
	out.write('unmapped:' + str(unmapped_count) + '\n')
	out.write('total:' + str(total) + '\n')

print('mapped:', str(mapped_count))
print('unmapped:', str(unmapped_count))
print('total:', str(total))