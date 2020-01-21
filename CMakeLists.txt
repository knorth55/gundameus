cmake_minimum_required(VERSION 2.8.3)
project(gundameus)

find_package(catkin REQUIRED COMPONENTS
    gundam_rx78_description
    roseus
)

add_custom_command(OUTPUT ${PROJECT_SOURCE_DIR}/robots/gundam-rx78.l
    COMMAND rosrun euscollada collada2eus gundam_rx78.dae gundam_rx78.yaml gundam-rx78.l
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/robots
    DEPENDS ${PROJECT_SOURCE_DIR}/robots/gundam_rx78.dae ${PROJECT_SOURCE_DIR}/robots/gundam_rx78.yaml)
add_custom_command(OUTPUT ${PROJECT_SOURCE_DIR}/robots/gundam_rx78.dae
    COMMAND rosrun collada_urdf urdf_to_collada ${gundam_rx78_description_SOURCE_PREFIX}/urdf/GGC_TestModel_rx78_20170112.urdf gundam_rx78.dae
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/robots
    DEPENDS ${gundam_rx78_description_SOURCE_PREFIX}/urdf/GGC_TestModel_rx78_20170112.urdf)

find_package(PkgConfig)
pkg_check_modules(COLLADA collada-dom>=2.4.4)
if(${COLLADA_FOUND})
  add_custom_target(generate_gundam-rx78_lisp ALL DEPENDS ${PROJECT_SOURCE_DIR}/robots/gundam-rx78.l)
else()
  pkg_check_modules(COLLADA collada-dom)
  message(WARNING "urdf_to_collada requries collada-dom >= 2.4.4, installed version is ${COLLADA_VERSION}")
endif()

catkin_package()
