setlocal EnableDelayedExpansion
@echo on

:: meson options
set ^"MESON_OPTIONS=^
  -Dgenerate_cmake_config=true ^
  -Dbuild_tests=false ^
  -Dbuild_examples=false ^
  --prefix="%LIBRARY_PREFIX%" ^
  --backend=ninja ^
 ^"

:: configure build using meson
%BUILD_PREFIX%\python.exe %BUILD_PREFIX%\Scripts\meson setup builddir !MESON_OPTIONS!
if errorlevel 1 exit 1

:: print results of build configuration
%BUILD_PREFIX%\python.exe %BUILD_PREFIX%\Scripts\meson configure builddir
if errorlevel 1 exit 1

ninja -v -C builddir -j %CPU_COUNT%
if errorlevel 1 exit 1

ninja -C builddir install -j %CPU_COUNT%
if errorlevel 1 exit 1
