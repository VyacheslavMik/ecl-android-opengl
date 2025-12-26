cmake_minimum_required(VERSION 3.4.1)

add_library(
  ecl
  SHARED
  IMPORTED
)

set_target_properties(
  ecl
  PROPERTIES IMPORTED_LOCATION
  ${CMAKE_CURRENT_SOURCE_DIR}/../../../libs/ecl-android/lib/libecl.so
)

include_directories( ${CMAKE_CURRENT_SOURCE_DIR}/../../../libs/ecl-android/include/ )

add_library(
  jni
  SHARED
  logging.h
  logging.c
  ecl_boot.h
  ecl_boot.c
  JNILib.h
  JNILib.c
)

find_library(
  log-lib
  log
  libc
)

target_link_libraries(
  jni
  android
  ecl
  ${log-lib}
  EGL
  GLESv2
)

include_directories(ecl-android/include/)
