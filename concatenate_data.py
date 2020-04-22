
import os

path = "/scratch/fs45/nlu/data/blimp/data/blimptask/"
filenames = [path+'anaphor_gender_agreement.txt',
             path+'anaphor_number_agreement.txt']
with open(os.path.join(path, 'anaphor_test.txt'), 'w') as outfile:
    for fname in filenames:
        with open(fname) as infile:
            for line in infile:
                outfile.write(line)
