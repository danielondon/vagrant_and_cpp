cmake_minimum_required(VERSION 2.8)
PROJECT(cpp_cross_platform)

MESSAGE("CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}")

#CONAN
if (${WIN32})
    execute_process(COMMAND ${CMAKE_SOURCE_DIR}/install.bat ${CMAKE_SOURCE_DIR})
#else()
#	execute_process(COMMAND ${CMAKE_SOURCE_DIR}/install.sh ${CMAKE_SOURCE_DIR})
endif()

if(EXISTS ${CMAKE_SOURCE_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_SOURCE_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
endif()

#Boost
FIND_PACKAGE(Boost REQUIRED)

#Check C++ 11 and C++ 14
include(CheckCXXCompilerFlag)

CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
if(COMPILER_SUPPORTS_CXX11)
  MESSAGE("SUPPORTS C++ 11")
  if (CMAKE_VERSION VERSION_LESS "3.1")
    MESSAGE("CMAKE OLD VERSION")
    if (CMAKE_COMPILER_IS_GNUCC )    
      MESSAGE("GNUCC Compiler")
      SET (CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
    endif()
  else ()
    SET(CMAKE_CXX_STANDARD 11)    
  endif()
else()
  MESSAGE("DOES NOT SUPPORT C++ 11")
endif()

CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
if(COMPILER_SUPPORTS_CXX14)
  MESSAGE("SUPPORTS C++ 14")
  SET(CMAKE_CXX_STANDARD 14)
else()
  MESSAGE("DOES NOT SUPPORT C++ 14")
endif()

# Flags (Trying different ways to enable try/catch/throw with VS2015 and CLang)

#SET(CLANG_COMPILE_FLAGS "-fexceptions")
#add_definitions(${CLANG_COMPILE_FLAGS})
#set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CLANG_COMPILE_FLAGS}")
#target_compile_options(first-test PRIVATE -fexceptions)

# Output Directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Verbose
#SET (CMAKE_VERBOSE_MAKEFILE 0)

add_subdirectory(src)
add_subdirectory(test)
