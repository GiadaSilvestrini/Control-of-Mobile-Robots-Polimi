cmake_minimum_required(VERSION 3.0.2)
project(ros_basics)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
)

## Build listener

catkin_package()
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(counter src/counter.cpp)
target_link_libraries(counter ${catkin_LIBRARIES})

add_executable(sumup src/sumup.cpp)
target_link_libraries(sumup ${catkin_LIBRARIES})

add_executable(clock src/system_clock.cpp)
target_link_libraries(clock ${catkin_LIBRARIES})