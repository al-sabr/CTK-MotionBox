file(GLOB_RECURSE H_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/include/*")
file(GLOB_RECURSE CPP_FILES RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
#[[
list(APPEND H_FILES
  resource/QmitkMemoryUsageIndicatorImagesGreen.xpm
  resource/QmitkMemoryUsageIndicatorImagesOrange.xpm
  resource/QmitkMemoryUsageIndicatorImagesRed.xpm
  resource/QmitkMemoryUsageIndicatorImagesYellow.xpm
)


set(CPP_FILES
  src/QmitkAbstractDataStorageModel.cpp
  src/QmitkAbstractMultiWidget.cpp
  src/QmitkAbstractNodeSelectionWidget.cpp
  src/QmitkApplicationCursor.cpp
  src/QmitkDataStorageComboBox.cpp
  src/QmitkDataStorageDefaultListModel.cpp
  src/QmitkDataStorageHistoryModel.cpp
  src/QmitkDataStorageListModel.cpp
  src/QmitkDataStorageTableModel.cpp
  src/QmitkDataStorageSimpleTreeModel.cpp
  src/QmitkDataStorageTreeModel.cpp
  src/QmitkDataStorageTreeModelInternalItem.cpp
  src/QmitkDnDDataNodeWidget.cpp
  src/QmitkFileReaderOptionsDialog.cpp
  src/QmitkFileReaderWriterOptionsWidget.cpp
  src/QmitkFileWriterOptionsDialog.cpp
  src/QmitkInteractionSchemeToolBar.cpp
  #src/QmitkIOUtil.cpp
  src/QmitkLevelWindowPresetDefinitionDialog.cpp
  src/QmitkLevelWindowRangeChangeDialog.cpp
  src/QmitkLevelWindowWidgetContextMenu.cpp
  src/QmitkLevelWindowWidget.cpp
  src/QmitkLineEditLevelWindowWidget.cpp
  src/QmitkMemoryUsageIndicatorView.cpp
  src/QmitkMouseModeSwitcher.cpp
  src/QmitkMimeTypes.cpp
  src/QmitkMultiWidgetConfigurationToolBar.cpp
  src/QmitkMultiWidgetLayoutManager.cpp
  src/QmitkMultiWidgetLayoutSelectionWidget.cpp
  src/QmitkNodeDescriptor.cpp
  src/QmitkColoredNodeDescriptor.cpp
  src/QmitkNodeDescriptorManager.cpp
  src/QmitkProgressBar.cpp
  src/QmitkPropertiesTableEditor.cpp
  src/QmitkPropertiesTableModel.cpp
  src/QmitkPropertyDelegate.cpp
  src/QmitkRegisterClasses.cpp
  src/QmitkRenderingManager.cpp
  src/QmitkRenderingManagerFactory.cpp
  src/QmitkRenderWindow.cpp
  src/QmitkRenderWindowMenu.cpp
  src/QmitkRenderWindowWidget.cpp
  #src/QmitkServiceListWidget.cpp
  src/QmitkSliderLevelWindowWidget.cpp
  src/QmitkStdMultiWidget.cpp
  src/QmitkMxNMultiWidget.cpp
  src/QmitkDataStorageComboBoxWithSelectNone.cpp
  src/QmitkDataStorageFilterProxyModel.cpp
  src/QmitkPropertyItem.cpp
  #src/QmitkPropertyItemDelegate.cpp
  #src/QmitkPropertyItemModel.cpp
  src/QmitkStyleManager.cpp
  src/QmitkAbstractDataStorageInspector.cpp
  src/QmitkDataStorageFavoriteNodesInspector.cpp
  src/QmitkDataStorageListInspector.cpp
  src/QmitkDataStorageTreeInspector.cpp
  src/QmitkDataStorageSelectionHistoryInspector.cpp
  src/QmitkModelViewSelectionConnector.cpp
  src/mitkIDataStorageInspectorProvider.cpp
  src/mitkQtWidgetsActivator.cpp
  src/mitkDataStorageInspectorGenerator.cpp
  src/QmitkOverlayWidget.cpp
  src/QmitkSimpleTextOverlayWidget.cpp
  src/QmitkNodeDetailsDialog.cpp
)
]]

set(MOC_H_FILES
  include/QmitkAbstractDataStorageModel.h
  include/QmitkAbstractMultiWidget.h
  include/QmitkAbstractNodeSelectionWidget.h
  include/QmitkDataStorageComboBox.h
  include/QmitkDataStorageTableModel.h
  include/QmitkDataStorageTreeModel.h
  include/QmitkDataStorageSimpleTreeModel.h
  include/QmitkDataStorageDefaultListModel.h
  include/QmitkDnDDataNodeWidget.h
  include/QmitkFileReaderOptionsDialog.h
  include/QmitkFileReaderWriterOptionsWidget.h
  include/QmitkFileWriterOptionsDialog.h
  include/QmitkInteractionSchemeToolBar.h
  include/QmitkLevelWindowPresetDefinitionDialog.h
  include/QmitkLevelWindowRangeChangeDialog.h
  include/QmitkLevelWindowWidgetContextMenu.h
  include/QmitkLevelWindowWidget.h
  include/QmitkLineEditLevelWindowWidget.h
  include/QmitkMemoryUsageIndicatorView.h
  include/QmitkMouseModeSwitcher.h
  include/QmitkMultiWidgetConfigurationToolBar.h
  include/QmitkMultiWidgetLayoutManager.h
  include/QmitkMultiWidgetLayoutSelectionWidget.h
  include/QmitkNodeDescriptor.h
  include/QmitkColoredNodeDescriptor.h
  include/QmitkNodeDescriptorManager.h
  include/QmitkProgressBar.h
  include/QmitkPropertiesTableEditor.h
  include/QmitkPropertyDelegate.h
  include/QmitkRenderingManager.h
  include/QmitkRenderWindow.h
  include/QmitkRenderWindowMenu.h
  include/QmitkRenderWindowWidget.h
  include/QmitkServiceListWidget.h
  include/QmitkSliderLevelWindowWidget.h
  include/QmitkStdMultiWidget.h
  include/QmitkMxNMultiWidget.h
  include/QmitkDataStorageComboBoxWithSelectNone.h
  include/QmitkPropertyItemDelegate.h
  include/QmitkPropertyItemModel.h
  include/QmitkAbstractDataStorageInspector.h
  include/QmitkDataStorageFavoriteNodesInspector.h
  include/QmitkDataStorageListInspector.h
  include/QmitkDataStorageTreeInspector.h
  include/QmitkDataStorageHistoryModel.h
  include/QmitkDataStorageSelectionHistoryInspector.h
  include/QmitkModelViewSelectionConnector.h
  include/QmitkOverlayWidget.h
  include/QmitkSimpleTextOverlayWidget.h
  include/QmitkNodeDetailsDialog.h
)

set(UI_FILES
  src/QmitkFileReaderOptionsDialog.ui
  src/QmitkFileWriterOptionsDialog.ui
  src/QmitkLevelWindowPresetDefinition.ui
  src/QmitkLevelWindowWidget.ui
  src/QmitkLevelWindowRangeChange.ui
  src/QmitkMemoryUsageIndicator.ui
  src/QmitkMultiWidgetLayoutSelectionWidget.ui
  src/QmitkServiceListWidgetControls.ui
  src/QmitkDataStorageListInspector.ui
  src/QmitkDataStorageTreeInspector.ui
  src/QmitkDataStorageSelectionHistoryInspector.ui
)

set(QRC_FILES
  resource/Qmitk.qrc
)

set(KIT_MOC_SRCS ${H_FILES})

set(KIT_SRCS ${CPP_FILES})

set(KIT_GENERATED_MOC_SRCS ${MOC_H_FILES})

set(KIT_RESOURCEFILES ${RESOURCEFILES})

set(KIT_UI_FORMS ${UI_FILES})

# Resources
set(KIT_resources ${QRC_FILES})