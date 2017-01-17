DIRECTORY="cpp-crossplatform/build"
if [ -d $DIRECTORY ]; then
  echo "Cleaning"
  ./clean.sh
  # reinstalling conan
  cd cpp-crossplatform
  conan install
  cd ..
fi

cd cpp-crossplatform
mkdir build && cd build
cmake ..
cmake --build . -- -j 4