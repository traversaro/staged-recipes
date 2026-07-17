#!/usr/bin/env bash
set -euxo pipefail

# Workaround: these subprojects currently include ../../DinrailCMakeCommon.cmake.
ln -sf cmake/DinrailCMakeCommon.cmake DinrailCMakeCommon.cmake

cmake -S src/yarp -B build-libdinrail-yarp -GNinja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  ${CMAKE_ARGS}
cmake --build build-libdinrail-yarp -j "${CPU_COUNT}"
cmake --install build-libdinrail-yarp
