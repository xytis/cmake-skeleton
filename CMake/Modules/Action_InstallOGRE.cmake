 
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/dist/bin)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/dist/media)
 
# post-build copy for win32
if(WIN32 AND NOT MINGW)
        add_custom_command( TARGET ${EXECUTABLE_NAME} PRE_BUILD
                COMMAND if not exist .\\dist\\bin mkdir .\\dist\\bin )
        add_custom_command( TARGET ${EXECUTABLE_NAME} POST_BUILD
                COMMAND copy \"$(TargetPath)\" .\\dist\\bin )
endif(WIN32 AND NOT MINGW)

if(MINGW OR UNIX)
        set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/dist/bin)
endif(MINGW OR UNIX)
 
if(WIN32)
 
        install(TARGETS ${EXECUTABLE_NAME}
                RUNTIME DESTINATION bin
                CONFIGURATIONS All)
 
        install(DIRECTORY ${CMAKE_SOURCE_DIR}/dist/Media
                DESTINATION ./
                CONFIGURATIONS Release RelWithDebInfo Debug
        )
 
        install(FILES ${CMAKE_SOURCE_DIR}/dist/bin/plugins.cfg
                ${CMAKE_SOURCE_DIR}/dist/bin/resources.cfg
                DESTINATION bin
                CONFIGURATIONS Release RelWithDebInfo
        )
 
        install(FILES ${CMAKE_SOURCE_DIR}/dist/bin/plugins_d.cfg
                ${CMAKE_SOURCE_DIR}/dist/bin/resources_d.cfg
                DESTINATION bin
                CONFIGURATIONS Debug
        )
 
        # NOTE: for the 1.7.1 sdk the OIS dll is called OIS.dll instead of libOIS.dll
        # so you'll have to change that to make it work with 1.7.1
        install(FILES ${OGRE_PLUGIN_DIR_REL}/OgreMain.dll
                ${OGRE_PLUGIN_DIR_REL}/RenderSystem_Direct3D9.dll
                ${OGRE_PLUGIN_DIR_REL}/RenderSystem_GL.dll
                ${OGRE_PLUGIN_DIR_REL}/libOIS.dll
                DESTINATION bin
                CONFIGURATIONS Release RelWithDebInfo
        )
 
        install(FILES ${OGRE_PLUGIN_DIR_DBG}/OgreMain_d.dll
                ${OGRE_PLUGIN_DIR_DBG}/RenderSystem_Direct3D9_d.dll
                ${OGRE_PLUGIN_DIR_DBG}/RenderSystem_GL_d.dll
                ${OGRE_PLUGIN_DIR_DBG}/libOIS_d.dll
                DESTINATION bin
                CONFIGURATIONS Debug
        )
 
   # as of sdk 1.7.2 we need to copy the boost dll's as well
   # because they're not linked statically (it worked with 1.7.1 though)
   install(FILES ${Boost_DATE_TIME_LIBRARY_RELEASE}
      ${Boost_THREAD_LIBRARY_RELEASE}
      DESTINATION bin
      CONFIGURATIONS Release RelWithDebInfo
   )
 
   install(FILES ${Boost_DATE_TIME_LIBRARY_DEBUG}
      ${Boost_THREAD_LIBRARY_DEBUG}
      DESTINATION bin
      CONFIGURATIONS Debug
   )
endif(WIN32)

if(UNIX)
 
        install(TARGETS ${EXECUTABLE_NAME}
                RUNTIME DESTINATION bin
                CONFIGURATIONS All)
 
        install(DIRECTORY ${CMAKE_SOURCE_DIR}/dist/media
                DESTINATION ./
                CONFIGURATIONS Release RelWithDebInfo Debug
        )
 
        install(FILES ${CMAKE_SOURCE_DIR}/dist/bin/plugins.cfg
                ${CMAKE_SOURCE_DIR}/dist/bin/resources.cfg
                DESTINATION bin
                CONFIGURATIONS Release RelWithDebInfo Debug
        )
 
endif(UNIX)