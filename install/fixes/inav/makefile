NEWOBJS=dataQueue.o

OBJS= clientComm.o clientCommData.o baseData.o snifferData.o sniffer.o ethernet.o ip.o tcp.o packet.o filterData.o graphData.o bandwidthMonitor.o ../common/semaphore.o icmp.o traceroute/tracerouteData.o traceroute/tracerouteThread.o ../common/commandLineParser.o ../common/xmlParser.o helper.o udp.o ../common/parseCommas.o debugThread.o ../common/mutex.o ../common/threads.o $(NEWOBJS)
TESTOBJS=$(OBJS) tester.o 
SERVOBJS=$(OBJS) inavServer.o
CC=g++
CXXFLAGS=-ggdb -g3 -D INAV_VERSION=$(VERSION)
OPTOMIZE=-O2 -funroll-loops -fprefetch-loop-arrays 
LDFLAGS=-pthread -lpcap
LDTESTFLAGS= $(LDFLAGS) -ldl -lcppunit
DEPEND= makedepend $(CFLAGS)
	
VERSION=$(shell ./version.sh)

inavd: $(SERVOBJS)
	$(CC) -o $@ $(SERVOBJS) $(LDFLAGS)

update: removeBuild removeMinorVersion svnUpdate inavd

all: unitTest inavd 

unitTest: $(TESTOBJS)
	$(CC) -o $@ $(TESTOBJS) $(LDTESTFLAGS) 

svnUpdate:
	svn update

removeBuild:
	-rm build.txt

removeMinorVersion:
	-rm minorVersion.txt

build: increaseBuild $(SERVOBJS) inavd

increaseBuild:
	-rm inavServer.o
	./version.sh -b

increaseVersion:
	-rm inavServer.o
	./version.sh -r 

release: increaseVersion $(SERVOBJS) inavd

clean:
	-rm *.o ../common/*.o inavd unitTest inavd.log traceroute/*.o
