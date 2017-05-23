# LHCb masterclass exercise

Official homepage:
[http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/index.html](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/index.html)

Video tutorial:
[https://www.youtube.com/watch?v=x2qJUbF2qUQ](https://www.youtube.com/watch?v=x2qJUbF2qUQ)

## Instructions: How to run the LHCb masterclass exercise

Download the program:

```
wget https://gitlab.cern.ch/LHCbOutreach/LHCbMasterclass/repository/archive.zip
unzip archive.zip
cd LHCbMasterclass-master-9d4462db97b87afedd752277de8608d68ed3813a/
```

## Build on Lxplus (AFS/EOS) without ROOT:

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

Expected output:

```
[ 11%] Generating LaunchDict.h, LaunchDict.C
Scanning dependencies of target LHCb_launcher
[ 22%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/LHCb_launcher.C.o
[ 33%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/launcher.cpp.o
[ 44%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/LaunchDict.C.o
[ 55%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/LHCb_D0_Exercise.C.o
[ 66%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/Frame.cpp.o
[ 77%] Building CXX object src/D0_Lifetime/CMakeFiles/LHCb_launcher.dir/LbMclassTrack.cpp.o
[ 88%] Linking CXX executable ../../bin/LHCb_launcher
[ 88%] Built target LHCb_launcher
Scanning dependencies of target symlinks
[100%] Create symlink to LHCb_launcher
[100%] Built target symlinks
```

Once the build is complete you can run the exercise with `./LHCb_launcher` even without setting up the environment.

## Run with Docker

Install Docker:
```
sudo curl -fsSL https://get.docker.com/ | sh
sudo service docker start
```

Modify the `Dockerfile` to replace `gid=1000` with your group ID. Find your group ID with `id -g <your-username>`.

Build and run the image:
```
sudo docker build -t lbmasterclass .
sudo docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix lbmasterclass

```

Inside the container type `./LHCb_launcher` to start the exercise.
To exit the exercise and the container run: `Ctrl` + `C` and then type `exit`.

