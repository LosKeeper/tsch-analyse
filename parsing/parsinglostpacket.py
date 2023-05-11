import matplotlib.pyplot as plt

def countlostpacket(numlog):
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
    return lostpacket,countsend

print(countlostpacket(369622))
print(countlostpacket(369629))
print(countlostpacket(369648))
xpoints=[1,2,10]
ypointssend=[countlostpacket(369622)[1],countlostpacket(369629)[1],countlostpacket(369648)[1]]
ypointslostpacket=[countlostpacket(369622)[0],countlostpacket(369629)[0],countlostpacket(369648)[0]]
plt.plot(xpoints,ypointssend)
plt.title("Number of send packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of send packet")
plt.show()

plt.plot(xpoints,ypointslostpacket)
plt.title("Number of lost packet depending on number of sender")
plt.xlabel("Number of sender")
plt.ylabel("Number of lost packet")
plt.show()