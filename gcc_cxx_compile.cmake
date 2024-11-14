
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/startup/stm32_flash.ld)
add_definitions(-DSTM32F10X_MD)
set(CMAKE_SYSTEM_PROCESSOR cortex-m3)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -g3  -O0 -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-exceptions -fno-rtti -fno-threadsafe-statics -fno-use-cxa-atexit -Wall -std=gnu++2a -fstack-usage --specs=nano.specs -mfloat-abi=soft -mthumb")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=${CMAKE_SYSTEM_PROCESSOR} -std=gnu${CMAKE_C_STANDARD} -g3 -O0 -ffunction-sections -fdata-sections -fno-strict-aliasing -Wall -fstack-usage --specs=nano.specs -mfloat-abi=soft -mthumb")
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=${CMAKE_SYSTEM_PROCESSOR} -g3 -T ${LINKER_SCRIPT}  -Wl,-Map=${PROJECT_NAME}.map  -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group")
set(CMAKE_ASM_FLAGS "-mcpu=${CMAKE_SYSTEM_PROCESSOR} -g3 -c -x assembler-with-cpp --specs=nano.specs -mfloat-abi=soft -mthumb")

set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <LINK_FLAGS> -o <TARGET> <OBJECTS>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <LINK_FLAGS> -o <TARGET> <OBJECTS>")
