# LHCb masterclass exercise

Official homepage:
[http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/index.html](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/index.html)

# Instructions 

## How to run LHCb masterclass exercise

Download the program:

```
wget https://gitlab.cern.ch/LHCbOutreach/LHCbMasterclass/repository/archive.zip
unzip archive.zip
cd LHCbMasterclass-master-9d4462db97b87afedd752277de8608d68ed3813a/
```

## Run on AFS/EOS without ROOT:

One way to run it on Lxplus:

```
LbLogin -c x86_64-slc5-gcc43-opt
SetupProject DaVinci v30r3
cmake .
make
./LHCb_launcher
```

Another way:

```
. /cvmfs/lhcb.cern.ch/lib/lcg/external/gcc/4.3.2/x86_64-slc5-gcc43-opt/setup.sh
. /cvmfs/lhcb.cern.ch/lib/lcg/app/releases/ROOT/5.32.02/x86_64-slc5-gcc43-opt/root/bin/thisroot.sh
cmake .
make
./LHCb_launcher

```

What used to work:
```
LbLogin -c x86_64-slc6-gcc48-opt
SetupProject DaVinci v36r3
cmake .
make
./LHCb_launcher
```


