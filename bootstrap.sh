#!/usr/bin/env bash
# Updating
apt-get update

############
# CMAKE
############

# Skip this installation because of license check
wget -c --no-check-certificate https://cmake.org/files/v3.6/cmake-3.6.3-Linux-x86_64.sh
chmod +x cmake-3.6.3-Linux-x86_64.sh
#export PATH=/home/vagrant/cmake-3.7.2-Linux-x86_64/bin:$PATH
#ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
mkdir /opt/cmake-3.6.3
#./cmake-3.6.3-Linux-x86_64.sh --prefix=/opt/cmake-3.6.3
#ln -s /opt/cmake-3.6.3/bin/cmake /usr/local/bin/cmake

#Alternative Way for cmake
# Get Build Essential
#apt-get -y build-essential 
#wget -c --no-check-certificate https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz
#tar xzvf cmake-3.7.2.tar.gz
#cd cmake-3.7.2/
#./bootstrap
#make -j4
#make install

#installing pip
apt-get -y install python-pip
#installing conan
pip install conan
#installing git
apt-get -y install git
# checking out project
su -c "git clone https://github.com/danielondon/cpp-cross-platform.git" -s /bin/sh vagrant
# installing dependencies with conan
cd cpp-cross-platform
conan install
