#! /bin/bash
brew install openssl libuv cmake zlib
git clone https://github.com/uWebSockets/uWebSockets 
cd uWebSockets
git checkout e94b6e1
patch CMakeLists.txt < ../cmakepatch.txt
mkdir build
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig 
cd build
OPENSSL_VERSION=`openssl version -v | cut -d' ' -f2`
cmake -DOPENSSL_ROOT_DIR=$(brew --cellar openssl)/${OPENSSL_VERSION}_1 -DOPENSSL_LIBRARIES=$(brew --cellar openssl)/${OPENSSL_VERSION}_1/lib ..
make 
sudo make install
cd ..
cd ..
sudo rm -r uWebSockets
