set(SRC_CPP_FILES
)

set(INTERNAL_CPP_FILES
  FractalCoreActivator.cpp
  FractalCoreApplication.cpp
  FractalCorePerspective.cpp
  EmptyView1.cpp
)

set(MOC_H_FILES
  src/internal/FractalCoreActivator.h
  src/internal/FractalCoreApplication.h
  src/internal/FractalCorePerspective.h
  src/internal/EmptyView1.h
)

set(CACHED_RESOURCE_FILES
  plugin.xml
  resources/perspectiveIcon1.png
  resources/viewIcon1.png
)

set(UI_FILES
  src/internal/EmptyView1Controls.ui
)

set(CPP_FILES )

foreach(file ${SRC_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/${file})
endforeach(file ${SRC_CPP_FILES})

foreach(file ${INTERNAL_CPP_FILES})
  set(CPP_FILES ${CPP_FILES} src/internal/${file})
endforeach(file ${INTERNAL_CPP_FILES})
