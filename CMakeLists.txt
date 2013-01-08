
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

# See http://git.libssh.org/projects/libssh.git/tree/ for example of a good project configuration.

# Global vars

SET(CMAKE_PROJECT_NAME "ProjectName")

SET(EXECUTABLE_NAME "Executable")

SET(EXECUTABLE_VERSION_MAJOR "0")
SET(EXECUTABLE_VERSION_MINOR "0")
SET(EXECUTABLE_VERSION_PATCH "0")

SET(EXECUTABLE_VERSION "${EXECUTABLE_VERSION_MAJOR}.${EXECUTABLE_VERSION_MINOR}.${EXECUTABLE_VERSION_PATCH}")

# Additional CMake modules, specific for this project
SET(CMAKE_MODULE_PATH
  ${CMAKE_SOURCE_DIR}/CMake/Modules
  )

# Load those modules
INCLUDE(Define_CMakeDefaults)
INCLUDE(Define_PlatformDefaults)
INCLUDE(Define_CompilerFlags)

# Project command is here, to set some values correctly.
PROJECT(${CMAKE_PROJECT_NAME})

# Nifty marco, which forbids in source build. (source: http://git.libssh.org/projects/libssh.git)
INCLUDE(Macro_EnsureOutOfSourceBuild)
MACRO_ENSURE_OUT_OF_SOURCE_BUILD("${PROJECT_NAME}  requires an out of source build. Please create a separate build directory and run 'cmake /path/to/${CMAKE_PROJECT_NAME} [options]' there.")

# Another macro used in this project to add sources efficiently.
INCLUDE(Macro_AddSources)

FIND_PACKAGE ( SDL REQUIRED )
FIND_PACKAGE ( SDL_image REQUIRED )
FIND_PACKAGE ( SDL_ttf REQUIRED )
FIND_PACKAGE ( Boost COMPONENTS serialization system filesystem REQUIRED )


MESSAGE(STATUS "Current built type: ${CMAKE_BUILD_TYPE}")
MESSAGE(STATUS "Current build type flags: ${CMAKE_CXX_FLAGS_${CMAKE_BUILD_TYPE}}")

MESSAGE(STATUS "Configuring application ${APPLICATION_NAME}")

MACRO_PREPARE_SOURCES(SRCS)

ADD_SUBDIRECTORY( src )

#Line below outputs all included source.
MACRO_PRINT_SOURCES()

INCLUDE_DIRECTORIES(
    ${Boost_INCLUDE_DIR}
)

ADD_EXECUTABLE(
    ${EXECUTABLE_NAME}
    ${SRCS}
)

TARGET_LINK_LIBRARIES(
    ${EXECUTABLE_NAME}
    ${SDL_LIBRARY}
    ${SDLIMAGE_LIBRARY}
    ${SDLTTF_LIBRARY}
)

