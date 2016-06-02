from sys import argv

script, filename = argv

target = open(filename, 'r')

first = 1
for line in target:
	if first < 1:
		elements = line.split('\t')
		print("{0}\t{1}\t{2}".format(elements[5],elements[6],elements[0]))
	else:
		first = 0	

target.close()