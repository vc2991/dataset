# opening the file
file1 = open("Employee records.txt", "r")
a=''
total = 0

for x in file1:

    if x[0] == 'S':

        for y in x:
            if y.isnumeric():
             a += y
        total += int(a)
        a=''
print(total)
