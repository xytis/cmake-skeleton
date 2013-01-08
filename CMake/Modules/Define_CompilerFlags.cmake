 
# Here should go compiler specific flags and stuff.

# This project uses C++11.
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

# Debug has -D_DEBUG
SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG")

# Release
SET(CMAKE_CXX_FLAGS_RELEASE "-O2")
