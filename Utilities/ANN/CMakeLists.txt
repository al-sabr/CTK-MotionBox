cmake_minimum_required(VERSION 3.10)

project(ann)

add_library(ann
    ANN/ANN.cpp
    ANN/ANN.h
    ANN/ANNperf.h
    ANN/ANNx.h
    ANN/bd_fix_rad_search.cpp
    ANN/bd_pr_search.cpp
    ANN/bd_search.cpp
    ANN/bd_tree.cpp
    ANN/bd_tree.h
    ANN/brute.cpp
    ANN/kd_dump.cpp
    ANN/kd_fix_rad_search.cpp
    ANN/kd_fix_rad_search.h
    ANN/kd_pr_search.cpp
    ANN/kd_pr_search.h
    ANN/kd_search.cpp
    ANN/kd_search.h
    ANN/kd_split.cpp
    ANN/kd_split.h
    ANN/kd_tree.cpp
    ANN/kd_tree.h
    ANN/kd_util.cpp
    ANN/kd_util.h
    ANN/perf.cpp
    ANN/pr_queue.h
    ANN/pr_queue_k.h
)

install(TARGETS ann LIBRARY ARCHIVE DESTINATION lib)
install(DIRECTORY "" DESTINATION include/ann FILES_MATCHING PATTERN "ANN*.h")

if("${CMAKE_SYSTEM_NAME}" MATCHES "Windows")
    install(FILES "${PROJECT_BINARY_DIR}/ann/CMakeFiles/ann.dir/ann.pdb" CONFIGURATIONS Debug DESTINATION lib)
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)


include_directories(${CMAKE_CURRENT_SOURCE_DIR})

target_include_directories(ann PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
