# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_numbers_fun_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED numbers_fun_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(numbers_fun_FOUND FALSE)
  elseif(NOT numbers_fun_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(numbers_fun_FOUND FALSE)
  endif()
  return()
endif()
set(_numbers_fun_CONFIG_INCLUDED TRUE)

# output package information
if(NOT numbers_fun_FIND_QUIETLY)
  message(STATUS "Found numbers_fun: 0.0.0 (${numbers_fun_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'numbers_fun' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message(WARNING "${_msg}")
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(numbers_fun_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${numbers_fun_DIR}/${_extra}")
endforeach()
