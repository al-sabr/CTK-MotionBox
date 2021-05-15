
set(SRC_CPP_FILES
  src/mitkCoreExtConstants.cpp
  
)

set(INTERNAL_CPP_FILES
  src/internal/mitkCoreExtActivator.cpp
  src/internal/mitkInputDeviceRegistry.cpp
  src/internal/mitkInputDeviceDescriptor.cpp
)

set(PLUGIN_CACHED_RESOURCEFILES
  plugin.xml
)

set(PLUGIN_MOC_SRCS
  include/internal/mitkCoreExtActivator.h
  include/internal/mitkInputDeviceRegistry.h
  include/mitkCoreExtConstants.h
  include/mitkIInputDeviceDescriptor.h
  include/mitkIInputDeviceRegistry.h
  include/mitkIInputDevice.h
)

set(PLUGIN_SRCS ${SRC_CPP_FILES} ${INTERNAL_CPP_FILES})