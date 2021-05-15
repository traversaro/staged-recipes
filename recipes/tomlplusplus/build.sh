meson builddir ${MESON_ARGS} -Dgenerate_cmake_config=true -Dbuild_tests=false -Dbuild_examples=false --prefix=$PREFIX
cd builddir
ninja
ninja install
