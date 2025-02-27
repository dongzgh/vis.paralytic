# Install the executable to the temporary directory
install(PROGRAMS "${CMAKE_RUNTIME_OUTPUT_DIR}/${CMAKE_PROJECT_NAME}" DESTINATION /opt/${CMAKE_PROJECT_NAME}/bin/)

# Get Qt6 lib directory
get_target_property(Qt6_LIB_DIR Qt6::Core LOCATION)
get_filename_component(Qt6_LIB_DIR ${Qt6_LIB_DIR} DIRECTORY)

# Install the Qt6 libraries to the temporary directory
install(DIRECTORY "${Qt6_LIB_DIR}" DESTINATION /opt/${CMAKE_PROJECT_NAME}/ USE_SOURCE_PERMISSIONS)

# Get Qt6 plugins directory
set(Qt6_PLUGINS_DIR "${Qt6_LIB_DIR}/../plugins")

# Install the Qt6 plugins to the temporary directory
install(DIRECTORY "${Qt6_PLUGINS_DIR}/platforms" DESTINATION /opt/${CMAKE_PROJECT_NAME}/plugins/ USE_SOURCE_PERMISSIONS)

# Install app script file
# Cope app stript file directly to usr/local/bin sometimes run into permission issues,
# so we copy it to /opt/${CMAKE_PROJECT_NAME} first
install(PROGRAMS "${CMAKE_SOURCE_DIR}/package/ubuntu/app.sh" DESTINATION /opt/${CMAKE_PROJECT_NAME}/)

# Install app desktop and icon file
install(FILES "${CMAKE_SOURCE_DIR}/package/ubuntu/app.desktop" DESTINATION /usr/share/applications/ RENAME ${CMAKE_PROJECT_NAME}.desktop)
install(FILES "${CMAKE_SOURCE_DIR}/package/ubuntu/app.svg" DESTINATION /usr/share/icons/hicolor/48x48/apps/ RENAME ${CMAKE_PROJECT_NAME}.svg)
