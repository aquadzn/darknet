import glob
import random


data = glob.glob('obj/*.jpg')

print(len(data))
random.shuffle(data)

train = data[:230]
valid = data[230:]

with open('train.txt', 'w') as t:
    for i in train:
        t.write(f"data/{i}\n")

with open('valid.txt', 'w') as v:
    for j in valid:
        v.write(f"data/{j}\n")

