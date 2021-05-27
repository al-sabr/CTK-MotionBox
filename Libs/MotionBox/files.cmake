
set(CPP_FILES
  src/global/main.cpp
  src/controllers/ControllerCore.cpp
  src/io/DataLocal.cpp
  src/io/DataLocal_patch.cpp
  src/io/DataOnline.cpp
)

set(MOC_H_FILES
  include/controllers/ControllerCore.h
  include/io/DataLocal.h
  include/io/DataOnline.h
  
)

set(UI_FILES
  
)

set(QRC_FILES
  dist/MotionBox.qrc
)

set(KIT_MOC_SRCS ${MOC_H_FILES})

set(KIT_SRCS ${CPP_FILES} ${MOC_H_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})