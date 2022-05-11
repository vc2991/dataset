import pandas as pd
import matplotlib.pyplot as plt
data= pd.read_csv("/Users/vardaan/Downloads/DynomoDB Data.csv")
data1=data[data.deviceid=='BSM_G101']
data2=data[data.deviceid=='BSM_G102']
sen1=data1[data1.datatype=='HeartRate']
sen2=data1[data1.datatype=='Temperature']
sen3=data1[data1.datatype=='SPO2']
i=int(input("enter 1 for aggregate Heartrate 2 for Temperature 3 for Sp02:\n"))
def h():
    c = []
    d = []
    t = []
    a = 0
    b = 0
    agg = 0
    for x in sen1.timestamp:
        c.append(x[0:2])
    for y in sen1.value:
        d.append(y)
    for x in c:
        if x not in t:
            t.append(x)
    for x in t:
        for y in c:
             if y==x:
                agg+=d[a]
                b+=1
                a+=1
        print("aggregate of min:",x,"=",agg/b)
        plt.scatter(x,(agg/b))
        agg=0
        b=0
    plt.title("Avg Heart Rate per minute")
    plt.show()
def t():
    c = []
    d = []
    t = []
    a = 0
    b = 0
    agg = 0
    for x in sen2.timestamp:
        c.append(x[0:2])
    for y in sen2.value:
        d.append(y)
    for x in c:
        if x not in t:
            t.append(x)
    for x in t:
        for y in c:
            if y == x:
                agg += d[a]
                b += 1
                a += 1
        print("aggregate of min:", x, "=", agg / b)
        plt.scatter(x, (agg / b))
        agg = 0
        b = 0
    plt.title("Avg Temperature per minute")
    plt.show()

def s():
    c = []
    d = []
    t = []
    a = 0
    b = 0
    agg = 0
    for x in sen3.timestamp:
        c.append(x[0:2])
    for y in sen3.value:
        d.append(y)
    for x in c:
        if x not in t:
            t.append(x)
    for x in t:
        for y in c:
            if y == x:
                agg += d[a]
                b += 1
                a += 1
        print("aggregate of min:", x, "=", agg / b)
        plt.scatter(x, (agg / b))
        agg = 0
        b = 0
    plt.title("Avg SP02 per minute")
    plt.show()
if i==1:
    h()
elif i==2:
    t()
elif i==3:
    s()









































