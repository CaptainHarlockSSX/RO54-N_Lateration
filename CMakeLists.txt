cmake_minimum_required(VERSION 3.25.0)

# Set the project name and version
project(N-Lateration LANGUAGES Swift)

if(CMAKE_SYSTEM_NAME STREQUAL Windows OR CMAKE_SYSTEM_NAME STREQUAL Darwin)
  option(BUILD_SHARED_LIBS "Build shared libraries by default" YES)
endif()

# Add the executable target
add_executable(N-Lateration
	src/main.swift;
	src/Device.swift;
	src/Emitter.swift;
	src/Receiver.swift;
	src/NLaterationSolver.swift)
