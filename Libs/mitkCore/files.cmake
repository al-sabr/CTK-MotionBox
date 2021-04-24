file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")

set(CPP_FILES
  src/mitkCoreActivator.cpp
  src/mitkCoreObjectFactoryBase.cpp
  src/mitkCoreObjectFactory.cpp
  src/mitkCoreServices.cpp
  src/mitkException.cpp

  src/DataManagement/mitkApplyTransformMatrixOperation.cpp
  src/DataManagement/mitkBaseData.cpp
  src/DataManagement/mitkBaseGeometry.cpp
  src/DataManagement/mitkBaseProperty.cpp
  src/DataManagement/mitkChannelDescriptor.cpp
  src/DataManagement/mitkColorProperty.cpp
  src/DataManagement/mitkDataNode.cpp
  src/DataManagement/mitkDataStorage.cpp
  src/DataManagement/mitkGeometry3D.cpp
  src/DataManagement/mitkGeometryTransformHolder.cpp
  src/DataManagement/mitkIdentifiable.cpp
  src/DataManagement/mitkImageAccessorBase.cpp
  src/DataManagement/mitkImageDataItem.cpp
  src/DataManagement/mitkImageDescriptor.cpp
  src/DataManagement/mitkIPropertyOwner.cpp
  src/DataManagement/mitkIPropertyProvider.cpp
  src/DataManagement/mitkLevelWindow.cpp
  src/DataManagement/mitkModifiedLock.cpp
  src/DataManagement/mitkNumericConstants.cpp
  src/DataManagement/mitkPropertyList.cpp
  src/DataManagement/mitkRestorePlanePositionOperation.cpp
  src/DataManagement/mitkRotationOperation.cpp
  src/DataManagement/mitkStringProperty.cpp
  src/DataManagement/mitkVector.cpp

  src/Interactions/mitkDataInteractor.cpp
  src/Interactions/mitkEventConfig.cpp
  src/Interactions/mitkEventStateMachine.cpp
  src/Interactions/mitkInteractionEventHandler.cpp
  src/Interactions/mitkStateMachineCondition.cpp
  src/Interactions/mitkStateMachineContainer.cpp
  src/Interactions/mitkStateMachineState.cpp

  src/IO/mitkLog.cpp

)

set(RESOURCE_FILES
resources/Interactions/globalConfig.xml
resources/Interactions/DisplayInteraction.xml
resources/Interactions/DisplayConfig.xml
resources/Interactions/DisplayConfigPACS.xml
resources/Interactions/DisplayConfigPACSPan.xml
resources/Interactions/DisplayConfigPACSScroll.xml
resources/Interactions/DisplayConfigPACSZoom.xml
resources/Interactions/DisplayConfigPACSLevelWindow.xml
resources/Interactions/DisplayConfigMITK.xml
resources/Interactions/DisplayConfigMITKNoCrosshair.xml
resources/Interactions/DisplayConfigMITKRotation.xml
resources/Interactions/DisplayConfigMITKRotationUnCoupled.xml
resources/Interactions/DisplayConfigMITKSwivel.xml
resources/Interactions/DisplayConfigMITKLimited.xml
resources/Interactions/PointSet.xml
resources/Interactions/Legacy/StateMachine.xml
resources/Interactions/Legacy/DisplayConfigMITKTools.xml
resources/Interactions/PointSetConfig.xml

resources/mitkLevelWindowPresets.xml
resources/mitkAnatomicalStructureColorPresets.xml
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})