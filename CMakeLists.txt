
cmake_minimum_required(VERSION 3.15.1)

project(SwiftMath LANGUAGES Swift)

# place all modules into `swift` in the root of the build tree
set(CMAKE_Swift_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/swift)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# enable shared libraries by default (Windows, Darwin)
#
# Windows does not yet support static libraries in Swift, Darwin no longer
# supports static libraries after ABI stability.
if(CMAKE_SYSTEM_NAME STREQUAL Windows OR CMAKE_SYSTEM_NAME STREQUAL Darwin)
  option(BUILD_SHARED_LIBS "Build shared libraries by default" YES)
endif()

include(CTest)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/swift-numerics/cmake/modules")

set(SWIFTMATH_BUILD_TESTING ${BUILD_TESTING})
set(BUILD_TESTING NO)

add_subdirectory(swift-numerics)
add_subdirectory(Sources/SwiftMath)
set(BUILD_TESTING ${SWIFTMATH_BUILD_TESTING})