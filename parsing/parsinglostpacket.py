import matplotlib.pyplot as plt

def countlostpacketTSCH(numlog):
    filename="assets/"+str(numlog)+".log"
    f=open(filename,"r")

    countsend=0
    countreceive=0
    for line in f.readlines():
        if(line.find("sent")!=-1):
            countsend+=1
        elif(line.find("received")!=-1):
            countreceive+=1

    lostpacket=countsend-countreceive
    return lostpacket,countsend,countreceive

def countlostpacketCSMA(numlog):
    filename="assets/"+str(numlog)+".log"
    f=open(filename,"r")

    countsend=0
    countreceive=0
    for line in f.readlines():
        if(line.find("sending")!=-1 or line.find("Sending")!=-1):
            countsend+=1
        elif(line.find("received")!=-1 or line.find("Received")!=-1):
            countreceive+=1

    lostpacket=countsend-countreceive
    return lostpacket,countsend,countreceive

print("TSCH")
print(countlostpacketTSCH(369622))
print(countlostpacketTSCH(369629))
print(countlostpacketTSCH(369648))

xpoints=[1,2,10]
ypointssend=[countlostpacketTSCH(369622)[1],countlostpacketTSCH(369629)[1],countlostpacketTSCH(369648)[1]]
ypointslostpacket=[countlostpacketTSCH(369622)[0],countlostpacketTSCH(369629)[0],countlostpacketTSCH(369648)[0]]

plt.figure(1,figsize=(15,10))
plt.subplot(221)
plt.plot(xpoints,ypointssend)
plt.title("TSCH : Number of send packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of send packet")

plt.subplot(222)
plt.plot(xpoints,ypointslostpacket)
plt.title("TSCH : Number of lost packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of lost packet")

print("CSMA")
print(countlostpacketCSMA(369653))
print(countlostpacketCSMA(369659))
print(countlostpacketCSMA(369820))

ypointssendCSMA=[countlostpacketCSMA(369653)[1],countlostpacketCSMA(369659)[1],countlostpacketCSMA(369820)[1]]
ypointslostpacketCSMA=[countlostpacketCSMA(369653)[0],countlostpacketCSMA(369659)[0],countlostpacketCSMA(369820)[0]]

plt.subplot(223)
plt.plot(xpoints,ypointssendCSMA)
plt.title("CSMA : Number of send packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of send packet")

plt.subplot(224)
plt.plot(xpoints,ypointslostpacketCSMA)
plt.title("CSMA : Number of lost packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of lost packet")
plt.show()