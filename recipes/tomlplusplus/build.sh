meson builddir ${MESON_ARGS} --prefix=$PREFIX
cd builddir
ninja
ninja install
