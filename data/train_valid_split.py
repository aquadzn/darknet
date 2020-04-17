import glob
import random


data = glob.glob('obj/*.jpg')
cut = 0.8 * len(data)
random.shuffle(data)


train = data[:cut]
valid = data[cut:]

with open('train.txt', 'w') as t:
    for i in train:
        t.write(f"data/{i}\n")

with open('valid.txt', 'w') as v:
    for j in valid:
        v.write(f"data/{j}\n")
