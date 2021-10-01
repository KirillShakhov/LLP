cmake_minimum_required(VERSION 3.17)
project(untitled ASM)
enable_language(ASM_NASM)

set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES>
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_ASM_NASM_FLAGS "${ASM_NASM_FLAGS} -g")
    set(CMAKE_ASM_NASM_FLAGS "${ASM_NASM_FLAGS} -felf64")
else()
    set(CMAKE_ASM_NASM_FLAGS "${ASM_NASM_FLAGS}")
    set(CMAKE_ASM_NASM_FLAGS "${ASM_NASM_FLAGS} -felf64")
endif()


set_source_files_properties(hello.asm PROPERTIES LANGUAGE ASM_NASM)

add_executable(program  hello.asm)