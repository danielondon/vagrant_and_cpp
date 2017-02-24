# vagrant_and_cpp
* We have to use Cmake 2.8, because thats the one is automatically updated with apt-get. We try to install latest versions, obaining the installer from the web, but the confirmation questions for license and installation folder, did not allow to automate the process.
* We upgrade to Ubuntu 14, because ubuntu 12, did not have defined compilation tools and it was necessary to install (build_essential). 
*Besides Ubuntu 14, comes with GCC 4.8 which supports C++ 11. Ubuntu 12, comes with GCC  4.6 which does not support C++ 11.
* Also be careful when creating sh files in windows. Use the tool dos2unix to convert them 

* vagrant up
* vagrant ssh
* cd /vagrant
* ./build.sh

# After machine is app, execute following commands:

cd /vagrant/cpp-crossplatform
mkdir build && cd build
cmake ..
cmake --build . -- -j 4
