import csv


filename= open("/scratch/fs45/nlu/data/CoLA/original/tokenized/out_of_domain_dev.tsv")
path = "/scratch/fs45/nlu/data/CoLA/original/tokenized/"
read_tsv = csv.reader(filename, delimiter="\t")
outfile = open("/scratch/fs45/nlu/data/CoLA/original/tokenized/outfile_out_domain_dev.txt", 'w+')
outfile.write('label\tsentence\n')
for row in read_tsv:
    outfile.write(row[1] + "\t" + row[3] + "\n")

