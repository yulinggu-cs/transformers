
import json
import pandas as pd
import re
import os
import nltk
nltk.download("punkt")
from nltk.tokenize import word_tokenize

#path = '../data/blimp'
path = "/scratch/fs45/nlu/data/blimp/data"

jsonls = []
for r, d, f in os.walk(path):
    for file in f:
        print(file)
        if '.jsonl' in file:
             jsonls.append(file)

print(jsonls)

for jsonl in jsonls:
    infile = open(path+'/' +jsonl)
    infile = infile.readlines()
    infile_json = [json.loads(x) for x in infile]

    sentences = []

    outfile = open(path+'/blimptask/'+jsonl[:-6]+'.txt', 'w')
    outfile.write('label\tsentence\n')
    for i in infile_json:
        outfile.write('1\t')
        outfile.write(' '.join(word_tokenize(i['sentence_good'])))
        outfile.write('\n')
        outfile.write('0\t')
        outfile.write(' '.join(word_tokenize(i['sentence_bad'])))
        outfile.write('\n')
