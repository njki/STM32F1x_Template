set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)

cmake_minimum_required(VERSION 3.20)

include(gcc_arm-none-eabi.cmake)

project(stm32StdLibTemplate C CXX ASM)

add_compile_options(-DSTM32F10X_MD)
include(gcc_cxx_compile.cmake)



add_link_options(-Wl,-gc-sections,--print-memory-usage,-Map=${PROJECT_BINARY_DIR}/${PROJECT_NAME}.map)


include_directories(.)
include_directories(src)
include_directories(Libraries/CMSIS/CM3/CoreSupport)
include_directories(Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x)
include_directories(Libraries/STM32F10x_StdPeriph_Driver/inc)




#add_definitions(-DSTM32F411xE -DUSE_STDPERIPH_DRIVER)


file(GLOB SOURCES
            "src/*.*"
            "Libraries/STM32F10x_StdPeriph_Driver/src/*.*"
            "Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/startup/TrueSTUDIO/startup_stm32f10x_md.s"
            "Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.c"
)


add_executable(${PROJECT_NAME} ${STARTUP_LOCATION} ${INCLUDE_FILES} ${SOURCES})

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Oihex ${PROJECT_NAME}.elf ${PROJECT_NAME}.hex)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ARGS -Obinary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${SIZE} ARGS --format=berkeley ${PROJECT_NAME}.elf)
